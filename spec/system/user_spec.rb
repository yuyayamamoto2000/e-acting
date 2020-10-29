require 'rails_helper'
RSpec.describe 'ユーザー機能', type: :system do#describeには、「何の仕様についてなのか」

  let!(:user){ FactoryBot.create(:user) }

  describe 'ユーザー登録' do
    context 'ユーザーが新規作成した場合' do #contextには「状況・状態を分類」したテスト内容
      it '作成したユーザーが表示される' do#itには「期待する動作」を記載します。

        visit  new_user_session_path

        click_on 'アカウント登録'

        fill_in 'user[name]', with: 'user'
        fill_in 'user[email]',with: 'user@gmail.com'
        fill_in 'user[password]',with: 'user@gmail.com'
        fill_in 'user[password_confirmation]',with: 'user@gmail.com'
        click_on 'commit'

        expect(page).to have_content 'user'

      end
      binding.irb
    end
  end
  # describe 'セッション機能テスト' do
  # context '一般ユーザー' do
  #   it "ログインができる事" do
  #     visit new_user_session_path
  #     fill_in 'session[email]',with: 'test@gmail.com'
  #     fill_in 'session[password]',with: 'password'
  #     sleep 0.5
  #     click_on 'commit'
  #     expect(page).to have_content 'タスク一覧'
  #   end
  # end
  #   context 'ログインしている場合' do
  #     before do
  #       visit new_session_path
  #       fill_in 'session[email]',with: 'test@gmail.com'
  #       fill_in 'session[password]',with: 'password'
  #       sleep 0.5
  #       click_on 'commit'
  #     end
  #     it "詳細ページに移動" do
  #       click_on 'Profile'
  #       expect(page).to have_content 'test@gmail.com'
  #     end
  #     it '他人の詳細ページにとぶとタスク一覧画面に戻されること' do
  #       visit user_path(admin_user.id)
  #       expect(page).to have_content 'アクセスできません。'
  #     end
  #     it 'ログアウトができる' do
  #       click_on 'Logout'
  #       expect(page).to have_content 'ログアウトしました。'
  #     end
  #   end
  # end
end
