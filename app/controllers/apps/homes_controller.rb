class Apps::HomesController < Apps::ApplicationController
  def index
    @columns = Column.where(status: "active").limit(20).order('created_at DESC')
    @todo = Todo.order("RANDOM()").limit(1)
  end

  def show
    @column = Column.find_by(id: params[:id])
  end

  def category_search
    @columns  = Column.where(category_id: params[:category_id], status: "active") rescue nil
    @category = Category.find(params[:category_id]) rescue nil
  end

end
