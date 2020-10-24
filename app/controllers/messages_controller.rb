class MessagesController < ApplicationController
  before_action do
    @conversation = Conversation.find(params[:conversation_id])
  end

end
