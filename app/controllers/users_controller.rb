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
      log_in @user
      redirect_to root_path, success: "登録完了"
    else
      render :new
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.id != current_user.id
      redirect_to root_path, notice: "他のアカウントから変更できません"
    elsif @user.update(user_params)
      redirect_to user_path(current_user.id), success: "変更しました"
    else
      render :edit
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :email, :image, :password, :password_confirmation, :description)
  end
   
end
