require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザーモデル機能', type: :model do
    describe 'バリデーションのテスト' do
      context 'name' do
        it '空の場合バリデーションにひっかかる' do
          user = User.new(name: '', profile: 'test', password: 'password', password_confirmation: 'password')
          expect(user).not_to be_valid
        end
        it "正常な場合バリデーションが通る" do
          @user = FactoryBot.create(:user)
          expect(@user).to be_valid
        end
      end

      context 'profile' do
        it '空の場合バリデーションにひっかかる' do
          user = User.new(name: 'test', profile: '', password: 'password', password_confirmation: 'password')
          expect(user).not_to be_valid
        end
        it "200文字以上の場合ひっかかる" do
          user = User.new(name: 'test', profile: 'a' *201, password: 'password', password_confirmation: 'password')
          expect(user).not_to be_valid
        end
      end

      context 'password' do
        it "空の場合ひっかかる" do
          user = User.new(name: 'test', profile: 'a *201', password: '', password_confirmation: 'password')
          expect(user).not_to be_valid
        end
        it "6文字以下の場合ひっかかる" do
          user = User.new(name: 'test', profile: 'a *201', password: 'aaaaa', password_confirmation: 'password')
          expect(user).not_to be_valid
        end
      end
      context 'password_confirmation' do
        it "空の場合ひっかかる" do
          user = User.new(name: 'test', profile: 'a *201', password: 'password', password_confirmation: '')
          expect(user).not_to be_valid
        end
        it "passwordと違う場合ひっかかる" do
          user = User.new(name: 'test', profile: 'a *201', password: 'aaaaaa', password_confirmation: 'password')
          expect(user).not_to be_valid
        end
      end
    end
  end
end
