class Apps::HomesController < Apps::ApplicationController
  def index
    @columns = Column.where(status: "active").limit(20).order('created_at DESC')
    @pickups = Column.where(status: "active", category_id: "1").limit(9).order('created_at DESC')
    @all_ranks = Column.find(Like.group(:column_id).order('count(column_id) desc').limit(6).pluck(:column_id))
    @todo = Todo.order("RANDOM()").limit(1)
  end

  def show
    @column = Column.find_by(id: params[:id])
  end

  def category_search
    @columns  = Column.where(category_id: params[:category_id], status: "active") rescue nil
    @category = Category.find(params[:category_id]) rescue nil
  end

  def searched_column
    @keyword = params[:keyword]
    @columns_search = Column.search(params[:keyword])

  end

end
