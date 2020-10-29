require 'rails_helper'

RSpec.describe Message, type: :model do
  describe 'メッセージモデル機能', type: :model do
    describe 'バリデーションのテスト' do
      context 'テキスト' do
        it '空の場合投稿されない' do
          message = Message.new(body: '')
          expect(message).not_to be_valid
        end
        it "正常な場合バリデーションが通る" do

          @sender_user = FactoryBot.create(:sender_user)
          @recipient_user = FactoryBot.create(:recipient_user)
          @conversation = Conversation.create!(sender_id: @sender_user.id, recipient_id: @recipient_user.id )

          message = Message.new(body: "test", conversation_id: @conversation.id, user_id: @sender_user.id)
          expect(message).to be_valid
        end
      end
    end
  end
end
