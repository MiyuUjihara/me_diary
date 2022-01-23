class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email])
    if user == user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash[:alert] = "ユーザー名又はパスワードが違います"
      render action: :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path notice: "ログアウトしました"
  end
end
