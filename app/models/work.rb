class Work < ApplicationRecord

  has_many :comments, dependent: :destroy

  validates :kind, presence: true
  validates :gametitle, presence: true
  validates :deadline, presence: true
  validates :reward, presence: true
  validates :payment, presence: true
  validates :gamemodel, presence: true
  validates :work, presence: true

  enum method: %i[ 代行 同行]
  enum gamemodel: %i[ PC PS4 XBOX Switch Iphone Android]
  enum payment: %i[ 銀行振り込み クレカ プリペイド]
end
