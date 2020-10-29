require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'コメントモデル機能', type: :model do
    describe 'バリデーションのテスト' do
      context 'テキスト' do
        it '空の場合投稿されない' do
          @user = FactoryBot.create(:recipient_user)
          @work = FactoryBot.create(:work, user_id: @user.id)
          comment = Comment.new(content: '', work_id: @work.id)
          expect(comment).not_to be_valid
        end
        it "正常な場合バリデーションが通る" do
          @user = FactoryBot.create(:recipient_user)
          @work = FactoryBot.create(:work, user_id: @user.id)
          comment = Comment.new(content: 'test', work_id: @work.id)
          expect(comment).to be_valid
        end
      end
    end
  end
end
