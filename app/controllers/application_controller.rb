class ApplicationController < ActionController::Base
  
  add_flash_types :success, :info, :warning, :danger
  
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end
  
  def log_in(user)
    session[:user_id] = user.id
  end
  
  private
    def require_login
      unless logged_in?
        redirect_to login_path, danger: "ログインしてください"
      end
    end  
  
end
