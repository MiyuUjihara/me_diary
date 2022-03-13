class Apps::HomesController < Apps::ApplicationController
  def index
    @columns = Column.status_active.limit(9).order('created_at DESC')
    @pickups = Column.status_active.where(category_id: "1").limit(5).order('created_at DESC')
    @all_ranks = Column.find(Like.group(:column_id).order('count(column_id) desc').limit(6).pluck(:column_id))
  end

  def show
    @column = Column.find_by(id: params[:id])
  end

  def category_search
    @columns  = Column.status_active.where(category_id: params[:category_id]).includes([:rich_text_content]) rescue nil
    @category = Category.find(params[:category_id]) rescue nil
  end

  def searched_column
    @keyword = params[:keyword]
    @columns_search = Column.search(params[:keyword])
    @columns_random = Column.set_romdom(9)
  end

  def searched_column_all
    @columns = Column.set_romdom(9)
  end


end
