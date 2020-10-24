class Conversation < ActiveRecord::Base
  # 会話はUserの概念をsenderとrecipientに分けた形でアソシエーションする。
  belongs_to :sender, foreign_key: :sender_id, class_name: 'User' #会話の送り手がユーザモデルから参照できるようにアソシエーションを設定
  belongs_to :recipient, foreign_key: :recipient_id, class_name: 'User' #会話の受け手がユーザモデルから参照できるようにアソシエーションを設定
  # 一つの会話はメッセージをたくさん含む一対多。
  has_many :messages, dependent: :destroy #会話は複数のメッセージを保有し、会話が削除されたらメッセージも削除する
  # [:sender_id, :recipient_id]が同じ組み合わせで保存されないようにするためのバリデーションを設定。
  validates_uniqueness_of :sender_id, scope: :recipient_id #同一のrecipient_idに対するsender_idは一意である（重複してはならない）。という制約を持たせています。
  # 下記で解説
  scope :between, -> (sender_id,recipient_id) do #送り手と受け手の「組み合わせ」で判定するbetweenスコープを定義する
    where("(conversations.sender_id = ? AND conversations.recipient_id =?) OR (conversations.sender_id = ? AND  conversations.recipient_id =?)", sender_id,recipient_id, recipient_id, sender_id)
  end
  # 下記で解説
  def target_user(current_user) #会話の相手の情報を取得する
    if sender_id == current_user.id
      User.find(recipient_id)
    elsif recipient_id == current_user.id
      User.find(sender_id)
    end
  end
end
