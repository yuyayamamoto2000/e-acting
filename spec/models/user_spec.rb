require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザーモデル機能', type: :model do
    describe 'バリデーションのテスト' do
      context 'name' do
        it '空の場合バリデーションにひっかかる' do
          user = User.new(name: '', email: 'test@gmail.com', profile: 'test', password: 'password', password_confirmation: 'password')
          expect(user).not_to be_valid
        end
        it "正常な場合バリデーションが通る" do
          @user = FactoryBot.create(:user)
          expect(@user).to be_valid
        end
      end

      context 'image'do
        it "入力しなくても登録される" do
          user = User.new(name: 'test', email: 'test@gmail.com', profile: 'test', password: 'password', password_confirmation: 'password',
                          image: Rack::Test::UploadedFile.new(File.join(Rails.root, "./app/assets/images/iphone.png")))
          expect(user).to be_valid
        end
      end

      context 'profile' do
        it '空の場合バリデーションにひっかかる' do
          user = User.new(name: 'test', email: 'test@gmail.com', profile: '', password: 'password', password_confirmation: 'password')
          expect(user).not_to be_valid
        end
        it "200文字以上の場合ひっかかる" do
          user = User.new(name: 'test', email: 'test@gmail.com', profile: 'a' *201, password: 'password', password_confirmation: 'password')
          expect(user).not_to be_valid
        end
      end

      context 'password' do
        it "空の場合ひっかかる" do
          user = User.new(name: 'test', email: 'test@gmail.com', profile: 'a *201', password: '', password_confirmation: 'password')
          expect(user).not_to be_valid
        end
        it "6文字以下の場合ひっかかる" do
          user = User.new(name: 'test', email: 'test@gmail.com', profile: 'a *201', password: 'aaaaa', password_confirmation: 'password')
          expect(user).not_to be_valid
        end
      end
      context 'password_confirmation' do
        it "空の場合ひっかかる" do
          user = User.new(name: 'test', email: 'test@gmail.com', profile: 'a *201', password: 'password', password_confirmation: '')
          expect(user).not_to be_valid
        end
        it "passwordと違う場合ひっかかる" do
          user = User.new(name: 'test', email: 'test@gmail.com', profile: 'a *201', password: 'aaaaaa', password_confirmation: 'password')
          expect(user).not_to be_valid
        end
      end
    end
  end
end
