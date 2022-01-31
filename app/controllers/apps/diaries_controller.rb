class Apps::DiariesController < Apps::ApplicationController
  before_action :set_diary, only: [:show, :edit, :update, :destroy]
  before_action :signed_in?
  before_action :require_sign_in!, only: [:new, :create, :edit, :upudate, :destroy]

  
  def new
    @diary = Diary.new
  end

  def create
    @diary = Diary.new(diary_params)
    if @diary.save
      redirect_to apps_user_path(@diary.user.name)
      flash[:notice] = "投稿が保存されました"
    else
      flash[:alert] = "投稿に失敗しました"
      render :new
    end
  end

  def show
  end

  def edit
   
  end
  
  def update
    if @diary.update(diary_params)
      redirect_to apps_user_path(@diary.user.name)
      flash[:notice] = "投稿を編集しました"
    else
      flash[:alert] = "投稿にの編集に失敗しました"
      render :edit
    end
  end


  def destroy
    if @diary.user == current_user
      flash[:notice] = "日記が削除されました" if @diary.destroy
    else
      flash[:alert] = "日記の削除に失敗しました"
    end
    redirect_to apps_diaries_path
  end

  private
    def diary_params
      params.require(:diary).permit(:title, :date, :caption, :image).merge(user_id: current_user.id)
    end

    def set_diary
      @diary = Diary.find_by(id: params[:id])
    end
end
