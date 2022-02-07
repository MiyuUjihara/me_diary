class Admin::ColumnsController < Admin::ApplicationController
  before_action :set_column, only: [:show, :edit, :update, :destroy]

  def index
    @column = Column.all
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
  end

  def destroy
  end

  private

    def column_params
      params.require(:column).permit(:title, :content, :image).merge(admin_user_id: current_admin_user.id)
    end

    def set_column
      @column = Column.find_by(id: params[:id])
    end
end