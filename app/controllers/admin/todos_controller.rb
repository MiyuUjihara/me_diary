class Admin::TodosController <  Admin::ApplicationController
  before_action :set_todo, only: [:show, :edit, :update, :destroy]

  def index
    @todos = Todo.all.order('created_at DESC').includes([:admin_user]).page(params[:page]).per(5)
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      redirect_to admin_todos_path
      flash[:notice] = "ToDoが作成されました"
    else
      flash[:alert] = "ToDoの作成に失敗しました"
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @todo.update(todo_params)
      redirect_to admin_todos_path
      flash[:notice] = "Todoを編集しました"
    else
      flash[:alert] = "Todoの編集に失敗しました"
      render :edit
    end
  end

  def destroy
    if @todo.admin_user_id == current_admin_user.id
      flash[:notice] = "ToDoが削除されました" if @todo.destroy
    else
      flash[:alert] = "Todoの削除に失敗しました"
    end
    redirect_to admin_todos_path
  end

  def search
    if params[:keyword].present?
      @keyword = params[:keyword]
      @todos_search = Todo.search(params[:keyword]).page(params[:page]).per(5)
    else
      redirect_to admin_todos_path
    end
  end

  private

    def todo_params
      params.require(:todo).permit(:title, :content, :image, :category_id, :status).merge(admin_user_id: current_admin_user.id)
    end

    def set_todo
      @todo = Todo.find_by(id: params[:id])
    end
end
