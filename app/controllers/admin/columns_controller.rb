class Admin::ColumnsController < Admin::ApplicationController
  before_action :set_column, only: [:show, :edit, :update, :destroy]

  def index
    @column = Column.limit(20).order('created_at DESC')
  end

  def new
    @column = Column.new
  end

  def create
    @column = Column.new(column_params)
    if @column.save
      redirect_to admin_columns_path
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
      redirect_to admin_columns_path
      flash[:notice] = "投稿を編集しました"
    else
      flash[:alert] = "投稿にの編集に失敗しました"
      render :edit
    end
  end

  def destroy
    if @column.user == current_admin_user
      flash[:notice] = "日記が削除されました" if @column.destroy
    else
      flash[:alert] = "日記の削除に失敗しました"
    end
    redirect_to admin_columns_path
  end

  private

    def column_params
      params.require(:column).permit(:title, :content, :image, :category_id).merge(admin_user_id: current_admin_user.id)
    end

    def set_column
      @column = Column.find_by(id: params[:id])
    end
end