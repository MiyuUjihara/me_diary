class Apps::UsersController < Apps::ApplicationController
  before_action :exist_sign_in!, only: [:new, :create]
  before_action :require_sign_in!, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "新規登録に成功しました"
      redirect_to apps_user_path(user)
    else
      flash[:alert] = "新規登録に失敗しました"
      render action: :new
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    @diaries = @user.diaries.order(created_at: :DESC)
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
