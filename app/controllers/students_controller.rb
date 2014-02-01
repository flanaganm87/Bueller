class StudentsController < ApplicationController
 
  def new
  end
  
  def index    
  end
  
  def create
    @student = Student.new(params[:student].permit(:name, :nickname, :email, :gravatar))
    if ( @student.gravatar.length == 0 )

        require 'digest/md5'
       email_address = @student.email.downcase
        hash = Digest::MD5.hexdigest(email_address)
        @student.gravatar = "http://www.gravatar.com/avatar/#{hash}"
         
    end
    @student.save
    if( @student.save )
      flash[:notice] = "You have succesfully created a student!"
      redirect_to @student, :flash => { :notice => "The student was successfully created!" }
    end
  end
  
  def edit
    @student = Student.find(params[:id])
  end
  
  def destroy
  end
  
  def update
     @student = Student.find(params[:id])
    if @student.update(params[:student].permit(:name, :nickname, :email, :gravatar))
      @student.save
      redirect_to @student, :flash => { :notice => "You successfully updated your student profile!" }
     
    else
        render 'edit'
    end   
   
  end
  
  def show
    @student = Student.find(params[:id])
    redirect_to :root
  end
  
  private
  def student_params
    params.require(:student.permit(:name, :nickname, :email, :gravatar))
  end
end