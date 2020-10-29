require 'rails_helper'

RSpec.describe Work, type: :model do
  describe 'ワークモデル機能', type: :model do
    describe 'バリデーションのテスト' do
      before do
        @user = FactoryBot.create(:recipient_user)
      end
      context 'gametitleが空の場合' do
        it 'バリデーションにひっかかる' do
          work = Work.new(kind: '代行', gametitle: '', deadline: '2020-10-30', reward: '20000', payment: 'クレカ', gamemodel: 'PS4', work: 'レベリング', user_id: @user.id )
          expect(work).not_to be_valid
        end
      end

      context 'deadline' do
        it '空の場合バリデーションにひっかかる' do
          work = Work.new(kind: '代行', gametitle: 'apex', deadline: '', reward: '20000', payment: 'クレカ', gamemodel: 'PS4', work: 'レベリング', user_id: @user.id )
          expect(work).not_to be_valid
        end
        it '過去の日付を選択した場合バリデーションにひっかかる' do
          work = Work.new(kind: '代行', gametitle: 'apex', deadline: '2020-09-30', reward: '20000', payment: 'クレカ', gamemodel: 'PS4', work: 'レベリング', user_id: @user.id )
          expect(work).not_to be_valid
        end

      end

      context 'rewardが空の場合' do
        it 'バリデーションにひっかかる' do
          work = Work.new(kind: '代行', gametitle: 'apex', deadline: '2020-10-30', reward: '', payment: 'クレカ', gamemodel: 'PS4', work: 'レベリング', user_id: @user.id )
          expect(work).not_to be_valid
        end
      end

      context 'gamemodelが空の場合' do
        it 'バリデーションにひっかかる' do
          work = Work.new(kind: '代行', gametitle: 'apex', deadline: '2020-10-30', reward: '20000', payment: 'クレカ', gamemodel: '', work: 'レベリング', user_id: @user.id )
          expect(work).not_to be_valid
        end
      end
      context 'workが空の場合' do
        it 'バリデーションにひっかかる' do
          work = Work.new(kind: '代行', gametitle: 'apex', deadline: '2020-10-30', reward: '20000', payment: 'クレカ', gamemodel: 'PS4', work: '', user_id: @user.id )
          expect(work).not_to be_valid
        end
      end
      context '必須項目が入力されてる場合' do
        it 'バリデーションにひっかからない' do
          work = Work.new(kind: '代行', gametitle: 'apex', deadline: '2020-10-30', reward: '20000', payment: 'クレカ', gamemodel: 'PS4', work: 'レベリング', user_id: @user.id )
          expect(work).to be_valid
        end
      end
    end
  end
end
