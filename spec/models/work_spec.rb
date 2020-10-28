require 'rails_helper'

RSpec.describe Work, type: :model do
  describe 'ワークモデル機能', type: :model do
    describe 'バリデーションのテスト' do
      context 'gametitleが空の場合' do
        it 'バリデーションにひっかる' do
          work = Work.new(method: '代行', gametitle: '', deadline: '2020-10-30', reward: '20000', payment: 'クレカ', gamemodel: 'PS4', work: 'レベリング' )
          expect(work).not_to be_valid
        end
      end

      context 'deadlineが空の場合' do
        it 'バリデーションにひっかる' do
          work = Work.new(method: '代行', gametitle: 'apex', deadline: '', reward: '20000', payment: 'クレカ', gamemodel: 'PS4', work: 'レベリング' )
          expect(work).not_to be_valid
        end
      end

      context 'rewardが空の場合' do
        it 'バリデーションにひっかる' do
          work = Work.new(method: '代行', gametitle: 'apex', deadline: '2020-10-30', reward: '', payment: 'クレカ', gamemodel: 'PS4', work: 'レベリング' )
          expect(work).not_to be_valid
        end
      end

      context 'gamemodelが空の場合' do
        it 'バリデーションにひっかる' do
          work = Work.new(method: '代行', gametitle: 'apex', deadline: '2020-10-30', reward: '20000', payment: 'クレカ', gamemodel: '', work: 'レベリング' )
          expect(work).not_to be_valid
        end
      end
      context 'workが空の場合' do
        it 'バリデーションにひっかる' do
          work = Work.new(method: '代行', gametitle: '', deadline: '2020-10-30', reward: '20000', payment: 'クレカ', gamemodel: 'PS4', work: '' )
          expect(work).not_to be_valid
        end
      end
    end
  end
end
