class Apps::HomesController < Apps::ApplicationController
  def index
  end

  def category_search
    @columns  = Column.where(category_id: params[:category_id]) rescue nil
    @category = Category.find(params[:category_id]) rescue nil
  end

end
