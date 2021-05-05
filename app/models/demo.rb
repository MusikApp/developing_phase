class Demo < ApplicationRecord
  belongs_to :user
  has_one_attached :video
  has_many :likes, dependent: :destroy
  validate :acceptable_demo

  def acceptable_demo
    return
  end
end
