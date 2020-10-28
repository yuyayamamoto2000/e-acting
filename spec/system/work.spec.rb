require 'rails_helper'
RSpec.describe 'タスク管理機能', type: :system do#describeには、「何の仕様についてなのか」

  let!(:first_work){ FactoryBot.create(:first_work) }
  let!(:second_work){ FactoryBot.create(:second_work) }
  let!(:third_work){ FactoryBot.create(:third_work) }
  let!(:user){ FactoryBot.create(:user) }
  # let(:label_list){ FactoryBot.create_list(:label, 10) }
  before do
    visit new_user_session_path
    fill_in 'user[email]', with: 'test@gmail.com'
    fill_in 'user[password]',with: 'password'
    click_on 'commit'
  end
  describe '新規作成機能' do
    context '依頼を新規作成した場合' do #contextには「状況・状態を分類」したテスト内容
      it '作成した依頼が表示される' do#itには「期待する動作」を記載します。
        visit works_path
        expect(page).to have_content 'テストタイトル'
      end
    end
  end
  describe '一覧表示機能' do#describeには、「何の仕様についてなのか」
    context '一覧画面に遷移した場合' do
      before do
        visit works_path
      end
      it '作成済みの依頼一覧が表示される' do
        expect(page).to have_content 'テストタイトル1'
      end
    end
    describe '検索機能' do
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
end
