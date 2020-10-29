class Comment < ApplicationRecord
  belongs_to :work

  validates :content, presence: true
end
