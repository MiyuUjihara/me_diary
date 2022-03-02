class Apps::Search::ColumnsController < Apps::ApplicationController

  def search
    if params[:keyword].present?
      @columns_search = Column.search(params[:keyword])
      @keyword = params[:keyword]
      redirect_to apps_searched_column_path(keyword: @keyword)
    else
      redirect_to apps_searched_column_all_path
    end
  end

end
