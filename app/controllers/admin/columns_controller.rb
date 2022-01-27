class Admin::ColumnsController < Admin::ApplicationController
  def index
  end

  def new
    @column = Column.new
  end

  def create
    column = Column.new(column_params)
    if column.save
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
  end

  def destroy
  end

  private
  def column_params
    params.require(:column).permit(:title, :content, :image).merge(admin_user_id: current_admin_user.id)
  end

end
