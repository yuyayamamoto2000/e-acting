class CommentsController < ApplicationController
  before_action :set_work, only: [:create, :edit, :update]
  # コメントを保存、投稿するためのアクションです。
  def create
    # Blogをパラメータの値から探し出し,Blogに紐づくcommentsとしてbuildします。
    @work = Work.find(params[:work_id])
    @comment = @work.comments.build(comment_params)
    # クライアント要求に応じてフォーマットを変更
    respond_to do |format|
      if @comment.save
        format.js { render :index }
      else
        format.html { redirect_to work_path(@work), notice: '投稿できませんでした...' }
      end
    end

    def edit
      @comment = @work.comments.find(params[:id])
      respond_to do |format|
        flash.now[:notice] = 'コメントの編集中'
        format.js { render :edit }
      end
    end

    def update
      @comment = @work.comments.find(params[:id])
      respond_to do |format|
        if @comment.update(comment_params)
          flash.now[:notice] = 'コメントが編集されました'
          format.js { render :index }
        else
          flash.now[:notice] = 'コメントの編集に失敗しました'
          format.js { render :edit_error }
        end
      end
    end
  end
  private
  # ストロングパラメーター
  def comment_params
    params.require(:comment).permit(:work_id, :content)
  end

  def set_work
    @work = Work.find(params[:work_id])
  end
end
