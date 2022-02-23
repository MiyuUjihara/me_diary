class Admin::UsersController < Admin::ApplicationController
  before_action :exist_sign_in!, only: [:new, :create]
  before_action :require_sign_in!, only: [:show]

  skip_before_action :require_sign_in!, only: [:new, :create]

  def home
    @columns = Column.limit(20).order('created_at DESC')
    @todos = Todo.all.order('created_at DESC')
  end
  
  def index
  end

  def new
    @admin_user = AdminUser.new
  end

  def create
    admin_user = AdminUser.new(admin_user_params)
    if admin_user.save
      session[:admin_user_id] = admin_user.id
      flash[:notice] = "新規登録に成功しました"
      redirect_to admin_user_path(admin_user)
    else
      flash[:alert] = "新規登録に失敗しました"
      render action: :new
    end
  end

  def show
    @admin_user = AdminUser.find_by(id: params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def admin_user_params
    params.require(:admin_user).permit(:name, :email, :password, :password_confirmation)
  end
end
