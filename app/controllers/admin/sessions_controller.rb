class Admin::SessionsController < Admin::ApplicationController
  skip_before_action :require_sign_in!, only: [:new, :create]
  before_action :exist_sign_in!, only: [:new, :create]
  
  def new
  end
  
  def create
    admin_user = AdminUser.find_by(email: params[:session][:email])
    if admin_user && admin_user.authenticate(params[:session][:password])
      session[:admin_user_id] = admin_user.id
      flash[:notice] = "ようこそ#{admin_user.name}様"
      redirect_to admin_root_path
    else
      flash[:alert] = "メールアドレス又はパスワードが違います"
      render action: :new
    end
  end

  def destroy
    session[:admin_user_id] = nil
    redirect_to admin_login_path notice: "ログアウトしました"
  end
end
