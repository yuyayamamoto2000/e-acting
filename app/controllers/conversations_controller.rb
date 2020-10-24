class ConversationsController < ApplicationController
  def index
    @conversations = Conversation.all
  end

  def create#senderが送り主で、recipientが受取人。
    if Conversation.between(params[:sender_id], params[:recipient_id]).present?#該当のユーザ間での会話が過去に存在しているか（該当ユーザー間で会話をするためのチャットルームがすでに存在しているか）を確認する式
      @conversation = Conversation.between(params[:sender_id], params[:recipient_id]).first#存在した場合、その会話（チャットルーム）情報を取得
    else
      @conversation = Conversation.create!(conversation_params)#もし、過去に一件も存在しなかった場合、強制的に会話（チャットルーム）情報を生成
    end
    redirect_to conversation_messages_path(@conversation)
  end

  private

  def conversation_params
    params.permit(:sender_id, :recipient_id)
  end
end
