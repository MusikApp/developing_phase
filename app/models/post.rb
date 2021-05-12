class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one_attached :video
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  validate :acceptable_image
  validate :acceptable_video
  validates :content, presence: { message: "El post debe tener contenido" }

  def image_thumbnail
    if image.attached?
      image.variant(resize_to_fill: [650, 500]).processed
    end
  end

  # def video_thumbnail
  #   if video.attached?
  #     video.variant(resize_to_fit: [500, 400]).processed
  #   end
  # end


  def self.followed_user(user)
    where(user_id: user.following.collect(&:followed_id))
  end

  def acceptable_image
    return unless image.attached?

    unless image.byte_size <= 11.megabyte
      errors.add(:image, "is too big")
    end

    acceptable_types = ["image/jpg", "image/jpeg", "image/gif", "image/png"]
    unless acceptable_types.include?(image.content_type)
    errors.add(:image, "must be a valid format")
    end
  end

  def acceptable_video
    return unless video.attached?

    unless video.byte_size <= 70.megabyte
      errors.add(:video, "is too big")
    end
  end
end
