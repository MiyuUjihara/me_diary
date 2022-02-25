class Apps::Search::ColumnsController < Apps::ApplicationController

  def search
    @columns_search = Column.search(params[:keyword])
    @keyword = params[:keyword]
    redirect_to apps_searched_column_path(keyword: @keyword)
  end

end
