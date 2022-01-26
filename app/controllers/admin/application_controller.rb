class Admin::ApplicationController < ApplicationController
  layout 'admin'
  helper_method :current_admin_user

  def current_admin_user
    @current_admin_user = AdminUser.find_by(id: session[:admin_user_id]) rescue nil 
  end

  def signed_in?
    current_admin_user.present?
  end

  def require_sign_in!
    unless signed_in?
      flash[:alert] = "管理者ログインしてください。"
      redirect_to admin_login_path 
    end
  end

  def exist_sign_in!
    if signed_in?
      flash[:alert] = "既にログイン済みです"
      redirect_to admin_users_path 
    end
  end
  
end
