class StudentsController < ApplicationController
 
  def new
  end
  
  def index    
  end
  
  def create
    @student = Student.new(student_params)
    @student.save
    redirect_to students_path
  end
  
  def edit
  end
  
  def destroy
  end
  
  def show
    @student = Student.find(params[:id])
  end
  
  private
  def student_params
    params.require(:student).permit(:name, :nickname, :email, :gravatar)
  end
  
end