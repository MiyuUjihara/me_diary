class Apps::UserTodosController < Apps::ApplicationController
  # before_action :set_user_todo, only: [:update]

  def index
    last_todo_day = current_user.user_todos.last.created_at.strftime("%Y年%m月%d日") rescue nil
    today         = Date.today.strftime("%Y年%m月%d日")
    if last_todo_day == today
      flash[:notice] = "本日のTodoは設定済みです"
      redirect_to apps_user_path(current_user.name)
    end

    @todos = Todo.find(Todo.pluck(:id).shuffle[0..2])
  end

  def create
    @user_todo = UserTodo.new(user_id: current_user.id, todo_id: params[:format])
    if @user_todo.save
      redirect_to apps_user_path(current_user.name)
    else
      render :index
    end
  end

  def update
    @user_todo = UserTodo.find_by(user_id: current_user.id, todo_id: params[:id].to_i)
    
    if @user_todo.update!(status: params[:status])
      flash[:notice] = params[:status] == "incomplete" ? "未完了やで！" : "完了やで！"  
      redirect_to apps_user_path(current_user.name)
    else
      flash[:notice] = "完了できまへんでした！！"
      render :show
    end

  end


  def selected
    @selected_todos = current_user.todos
  end

end
