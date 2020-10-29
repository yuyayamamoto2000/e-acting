class Work < ApplicationRecord

  has_many :comments, dependent: :destroy
  belongs_to :user

  validate :date_before_today, on: :create
  validates :kind, presence: true
  validates :gametitle, presence: true
  validates :deadline, presence: true
  validates :reward, presence: true
  validates :payment, presence: true
  validates :gamemodel, presence: true
  validates :work, presence: true

  def date_before_today
    errors.add(:deadline, "は本日以降のものを選択してください") if deadline.nil? || deadline < Date.today
  end

  enum method: %i[ 代行 同行]
  enum gamemodel: %i[ PC PS4 XBOX Switch Iphone Android]
  enum payment: %i[ 銀行振り込み クレカ プリペイド]

end
