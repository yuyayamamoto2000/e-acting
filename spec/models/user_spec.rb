require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザーモデル機能', type: :model do
    describe 'バリデーションのテスト' do
      context 'nameが空の場合' do
        it 'バリデーションにひっかる' do
          user = User.new(name: '', profile: '')
          expect(user).not_to be_valid
        end
      end

      context 'profileが空の場合' do
        it 'バリデーションにひっかる' do
          user = User.new(name: 'test', profile: '')
          expect(user).not_to be_valid
        end
      end
    end
  end
end
