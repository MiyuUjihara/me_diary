class Apps::LikesController < Apps::ApplicationController
  before_action :column_params

  def create
    Like.create(user_id: current_user.id, column_id: params[:id])
    redirect_to  apps_path()
  end

  def destroy
    Like.find_by(user_id: current_user.id, column_id: params[:id]).destroy
    redirect_to apps_path()
  end
  
private
  def column_params
    @column = Column.find(params[:id])
  end
end

