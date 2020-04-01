class UsersController < ApplicationController
  
  def new
    @user = User.new
  end
  
  def show
    @user = User.find_by(id: params[:id])
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, success: "登録完了"
    else
      render :new
    end
  end
  
  def edit
    @user = User.find_by(id: params[:id])
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :email, :image, :password, :password_confirmation, :description)
  end
   
end
