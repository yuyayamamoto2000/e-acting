require 'rails_helper'
RSpec.describe 'タスク管理機能', type: :system do#describeには、「何の仕様についてなのか」

  let!(:first_work){ FactoryBot.create(:first_work, user: user)  }
  let!(:second_work){ FactoryBot.create(:second_work, user: user) }
  let!(:third_work){ FactoryBot.create(:third_work, user: user) }
  let!(:user){ FactoryBot.create(:user) }
  # let(:label_list){ FactoryBot.create_list(:label, 10) }
  describe '新規作成機能' do
    before do
      visit new_user_session_path
      fill_in 'user[email]', with: 'test@gmail.com'
      fill_in 'user[password]',with: 'password'
      click_on 'commit'
    end
    context '依頼を新規作成した場合' do #contextには「状況・状態を分類」したテスト内容
      it '作成した依頼が表示される' do#itには「期待する動作」を記載します。

        visit new_work_path
        select '代行', from: 'work_kind'
        fill_in 'work[gametitle]', with: 'apex'
        select 'PS4', from: 'work_gamemodel'
        fill_in 'work[work]', with: 'テスト'
        fill_in 'work[deadline]', with: '2020-11-30'
        fill_in 'work[reward]', with: 20000
        select 'クレカ', from: 'work_payment'
        expect(page).to have_content ''
      end
    end
  end
  describe '一覧表示機能' do#describeには、「何の仕様についてなのか」
    before do
      visit new_user_session_path
      fill_in 'user[email]', with: 'test@gmail.com'
      fill_in 'user[password]',with: 'password'
      click_on 'commit'
    end
    context '一覧画面に遷移した場合' do
      before do
        visit works_path
      end
      it '作成済みの依頼一覧が表示される' do
        expect(page).to have_content 'テストタイトル1'
      end
    end
  end
  describe '検索機能' do
    before do
      visit new_user_session_path
      fill_in 'user[email]', with: 'test@gmail.com'
      fill_in 'user[password]',with: 'password'
      click_on 'commit'
    end

    context 'タイトルで検索をした場合' do
      it "検索キーワードを含む依頼が絞り込まれる" do
        visit works_path
        fill_in 'q[gametitle_cont]', with: '2'
        click_on :commit
        expect(page).to have_content 'テストタイトル2'
      end
    end
  end
end
