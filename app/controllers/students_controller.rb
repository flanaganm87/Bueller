class StudentsController < ApplicationController
 
  def new
  end
  
  def index    
  end
  
  def create
     render text: params[:post].inspect
  end
  
  def edit
  end
  
  def destroy
  end
  
  def show
  end
  
  private
  def post_params
    params.require(:post).permit(:name, :nickname, :email, :gravatar)
  end
  
end