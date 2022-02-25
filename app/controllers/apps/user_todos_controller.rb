class Apps::UserTodosController < Apps::ApplicationController

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

    @user_todo = UserTodo.find(params[:id])

    data = case params[:status]
            when "completed"
              {status: "completed", message: "本日のTodoを完了しました"} 
            when "incomplete"
              {status: "incomplete", message: "本日のTodoを未完了にしました"}
            end

    if @user_todo.update!(status: data[:status])
      flash[:notice] = data[:message]
      redirect_to apps_user_path(current_user.name)
    else
      flash[:notice] = "Todoのステータスを変更出来ませんでした"
      render :show
    end

  end


  def selected
    @current_user_todos = UserTodo.where(user_id: current_user.id)
  end

end
