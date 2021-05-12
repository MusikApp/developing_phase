class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  belongs_to :reply, class_name: "Comment", optional: true
  validates :content, presence: true

  has_many :replies , class_name: "Comment", foreign_key: "reply_id"

end
