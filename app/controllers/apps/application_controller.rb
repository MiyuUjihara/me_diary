class Apps::ApplicationController < ApplicationController
  layout 'apps'
  helper_method :current_user

  def current_user
    @current_user = User.find_by(id: session[:user_id]) rescue nil 
  end

  def signed_in?
    current_user.present?
  end

  def require_sign_in!
    unless signed_in?
      flash[:alert] = "アカウント登録もしくはログインしてください。"
      redirect_to apps_login_path 
    end
  end

  def exist_sign_in!
    if signed_in?
      flash[:alert] = "既にログイン済みです"
      redirect_to root_path 
    end
  end
  
end
