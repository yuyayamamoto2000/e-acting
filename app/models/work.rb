class Work < ApplicationRecord
  validates :method, presence: true
  validates :gametitle, presence: true
  validates :deadline, presence: true
  validates :reward, presence: true
  validates :payment, presence: true
  validates :model, presence: true
  validates :work, presence: true

  enum method: %i[選択してください 代行 同行]
  enum model: %i[選択してください PC PS4 XBOX Switch Iphone Android]
  enum payment: %i[選択してください 銀行振り込み クレカ プリペイド]
end
