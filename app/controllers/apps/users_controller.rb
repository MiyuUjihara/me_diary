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
    user_mismatch(params[:name])
    @diaries        = current_user.diaries.order('date DESC').limit(7)
    today_user_todo = current_user.user_todos.where(created_at: Time.zone.today.beginning_of_day..Time.zone.today.end_of_day).last
    @selected_todo  = current_user.todos.find_by(id: today_user_todo.todo_id) rescue nil
    @user_todo      = @selected_todo.user_todos.last rescue nil
    @todos = Todo.includes([:rich_text_content]).find(Todo.pluck(:id).shuffle[0..2])
  end

  def likes
    likes = Like.where(user_id: current_user).pluck(:column_id)
    @like_columns = Column.find(likes)
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def user_mismatch(user_name)
    return redirect_to apps_404_path unless user_name == current_user.name
  end

end
