class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :file
  validate :acceptable_file 

  def acceptable_file
    return unless file.attached?

    unless file.byte_size <= 70.megabyte
      errors.add(:file, "is too big")
    end

    acceptable_types = ["video/mov", "video/mp4", "video/avi", "image/jpg", "image/jpeg", "image/gif", "image/png"]
    unless acceptable_types.include?(file.content_type)
    errors.add(:file, "must be a valid format")
    end
  end
end
