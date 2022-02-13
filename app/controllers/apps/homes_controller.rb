class Apps::HomesController < Apps::ApplicationController
  def index
    @column = Column.limit(20).order('created_at DESC')
  end

  def show
    @column = Column.find_by(id: params[:id])
  end

  def category_search
    @columns  = Column.where(category_id: params[:category_id]) rescue nil
    @category = Category.find(params[:category_id]) rescue nil
  end

end
