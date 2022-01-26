class Apps::SessionsController < Apps::ApplicationController
  before_action :exist_sign_in!, only: [:new, :create]

  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to apps_user_path(user)
    else
      flash[:alert] = "メールアドレス又はパスワードが違います"
      render action: :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to apps_login_path notice: "ログアウトしました"
  end
end
