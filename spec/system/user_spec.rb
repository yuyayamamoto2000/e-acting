require 'rails_helper'
RSpec.describe 'ユーザー機能', type: :system do#describeには、「何の仕様についてなのか」

  let!(:user){ FactoryBot.create(:user) }
  let!(:user1){ FactoryBot.create(:user1) }

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

    end
  end
  describe 'セッション機能テスト' do
    context 'ユーザーログイン、ログアウト' do
      it "ログインができる事" do
        visit new_user_session_path
        fill_in 'user[email]',with: 'test@gmail.com'
        fill_in 'user[password]',with: 'password'
        sleep 0.5
        click_on 'commit'
        expect(page).to have_content 'test'
      end
      it "ログインできないこと" do
        visit new_user_session_path
        fill_in 'user[email]',with: 'apex@gmail.com'
        fill_in 'user[password]',with: 'password'
        sleep 0.5
        click_on 'commit'
        expect(page).to have_content 'メールアドレスまたはパスワードが違います。'
      end

      it 'ログアウトする' do
        visit new_user_session_path
        fill_in 'user[email]',with: 'test@gmail.com'
        fill_in 'user[password]',with: 'password'
        sleep 0.5
        click_on 'commit'
        click_on 'ログアウト'
        expect(page).to have_content 'ログアウトしました。'
      end
    end
  end
  describe 'コメント機能テスト' do
    before do
      visit new_user_session_path
      fill_in 'user[email]',with: 'test@gmail.com'
      fill_in 'user[password]',with: 'password'
      sleep 0.5
      click_on 'commit'
    end
    context 'コメントテスト' do
      it "コメントができる事" do
        click_on 'ユーザー一覧画面'
        click_on 'メッセージ'
        binding.irb
        fill_in 'message[body]', with: 'テスト'
        click_on 'commit'

      end

      # it "ログインできないこと" do
      #   visit new_user_session_path
      #   fill_in 'user[email]',with: 'apex@gmail.com'
      #   fill_in 'user[password]',with: 'password'
      #   sleep 0.5
      #   click_on 'commit'
      #   expect(page).to have_content 'メールアドレスまたはパスワードが違います。'
      # end
      #
      # it 'ログアウトする' do
      #   visit new_user_session_path
      #   fill_in 'user[email]',with: 'test@gmail.com'
      #   fill_in 'user[password]',with: 'password'
      #   sleep 0.5
      #   click_on 'commit'
      #   click_on 'ログアウト'
      #   expect(page).to have_content 'ログアウトしました。'
      # end
    end
  end
end
