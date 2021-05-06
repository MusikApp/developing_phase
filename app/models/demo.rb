class Demo < ApplicationRecord
  belongs_to :user
  has_one_attached :video, dependent: :destroy
end
