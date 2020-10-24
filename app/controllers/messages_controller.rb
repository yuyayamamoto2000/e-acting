class MessagesController < ApplicationController
  before_action do
    @conversation = Conversation.find(params[:conversation_id])
  end

  def index
    @messages = @conversation.messages #会話にひもづくメッセージを取得する
    if @messages.length > 10 #もしメッセージの数が10よりも大きければ、10より大きいというフラグを有効にしてメッセージを最新の10に絞ることをする
      @over_ten = true
      @messages = Message.where(id: @messages[-10..-1].pluck(:id)) #直近で登録されたメッセージの10件のidを取得し、そのidのmessageの配列をwhereメソッドで取得する
    end
    if params[:m] #そうでなければ10より大きいというフラグを無効にして、会話にひもづくメッセージをすべて取得する
      @over_ten = false
      @messages = @conversation.messages
    end
    if @messages.last #もし最新（最後）のメッセージが存在し、かつユーザIDが自分（ログインユーザ）でなければ、今映っているメッセージを全て既読にする
      @messages.where.not(user_id: current_user.id).update_all(read: true)
    end
    @messages = @messages.order(:created_at) #表示するメッセージを作成日時順（投稿された順）に並び替える
    @message = @conversation.messages.build #新規投稿のメッセージ用の変数を作成する
  end

  def create
    @message = @conversation.messages.build(message_params) #送られてきたparamsの値を利用して会話にひもづくメッセージを生成
    if @message.save #保存ができれば、会話にひもづくメッセージ一覧の画面（つまりチャットルーム）に遷移する
      redirect_to conversation_messages_path(@conversation)
    else
      render 'index'
    end
  end

  private

  def message_params
    params.require(:message).permit(:body, :user_id)
  end
end
