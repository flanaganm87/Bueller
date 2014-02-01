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
    redirect_to root_path
  end
  
  def edit
    @student = Student.find(params[:id])
  end
  
  def destroy
  end
  
  def update

     @student = Student.find(params[:id])
    if @student.update(params[:post].permit(:name, :nickname, :email, :gravatar))
      redirect_to @student
     else
        render 'edit'
    end   
   
  end
  
  def show
    @student = Student.find(params[:id])
  end
  
  private
  def student_params
    params.require(:post).permit(:name, :nickname, :email, :gravatar)
  end
  
end