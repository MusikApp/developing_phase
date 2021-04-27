class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one_attached :video
  validate :acceptable_image
  validate :acceptable_video

  def image_thumbnail
    if image.attached?
      image.variant(resize_to_fit: [500, 400]).processed
    end
  end

  # def video_thumbnail
  #   if video.attached?
  #     video.variant(resize_to_fit: [500, 400]).processed
  #   end
  # end

  def acceptable_image
    return unless image.attached?

    unless image.byte_size <= 4.megabyte
      errors.add(:file, "is too big")
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