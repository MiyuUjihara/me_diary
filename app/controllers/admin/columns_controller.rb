class Admin::ColumnsController < Admin::ApplicationController
  before_action :set_column, only: [:show, :edit, :update, :destroy]

  def index
  end

  def new
    @column = Column.new
  end

  def create
    @column = Column.new(column_params)
    if @column.save
      redirect_to admin_root_path
      flash[:notice] = "コラムが作成されました"
    else
      flash[:alert] = "コラムの作成に失敗しました"
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @column.update(column_params)
      redirect_to admin_root_path
      flash[:notice] = "コラムを編集しました"
    else
      flash[:alert] = "コラムの編集に失敗しました"
      render :edit
    end
  end

  def destroy
    if @column.admin_user_id == current_admin_user.id
      flash[:notice] = "コラムが削除されました" if @column.destroy
    else
      flash[:alert] = "コラムの削除に失敗しました"
    end
    redirect_to admin_root_path
  end

  private

    def column_params
      params.require(:column).permit(:title, :content, :image, :category_id, :status).merge(admin_user_id: current_admin_user.id)
    end

    def set_column
      @column = Column.find_by(id: params[:id])
    end
end