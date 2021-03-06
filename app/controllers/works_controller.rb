class WorksController < ApplicationController
  before_action :set_work, only: [:show, :edit, :update, :destroy]
  def index
    @q = Work.ransack(params[:q])
    @works = @q.result(distinct: true)
  end

  def new
    @work = Work.new  #Viewにデータを渡す(インスタンス変数を定義する)
  end

  def create
    @work = current_user.works.build(work_params)
    if params[:back]
      render :new
    else
      if @work.save
        # 一覧画面へ遷移して"ブログを作成しました！"とメッセージを表示します。
        redirect_to works_path, notice: "依頼を作成しました！"
      else
        # 入力フォームを再描画します。
        render :new
      end
    end
  end

  def show
    @comments = @work.comments
    @comment = @work.comments.build
  end

  def edit
  end

  def update
    @work = Work.find(params[:id])
    if @work.update(work_params)
      redirect_to works_path, notice: "依頼を編集しました！"
    else
      render :edit
    end
  end

  def destroy
    @work.destroy
    redirect_to works_path, notice: "依頼を消去しました！"
  end

  def confirm
    @work = current_user.works.build(work_params)
    render :new if @work.invalid?
  end

  private
  def work_params
    params.require(:work).permit(:kind, :gametitle, :deadline, :reward, :payment, :comment, :gamemodel, :work)
  end

  def set_work
    @work = Work.find(params[:id])
  end

end
