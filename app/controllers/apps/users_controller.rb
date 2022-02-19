class Apps::UsersController < Apps::ApplicationController
  before_action :exist_sign_in!, only: [:new, :create]
  before_action :require_sign_in!, only: [:show]

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      flash[:notice] = "新規登録に成功しました"
      redirect_to apps_user_path(user.name)
    else
      flash[:alert] = "新規登録に失敗しました"
      render action: :new
    end
  end

  def show
    if params[:name] != current_user.name
      return redirect_to apps_404_path 
    end
    @user = User.find_by(name: params[:name])
    @diaries = @user.diaries.order('date DESC').limit(7)
    @diary = Diary.find_by(id: params[:id])
    @todo = Todo.order("RANDOM()").limit(1)
  end

  def likes
    likes = Like.where(user_id: current_user).pluck(:column_id)
    @like_columns = Column.find(likes)
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
