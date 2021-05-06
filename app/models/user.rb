class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :following, foreign_key: "follower_id", class_name: "Relationship"
  has_many :followers, foreign_key: "followed_id", class_name: "Relationship"
  has_many :posts
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :messages
  has_many :rooms, foreign_key: :sender_id
  has_many :notifications, as: :recipient

  def self.followed_user(user)
    where(id: user.following.collect(&:followed_id))
  end
         
  has_one_attached :avatar  
  validate :acceptable_avatar 
  after_commit :add_default_avatar, on: %i[ create update ] 

  def acceptable_avatar
    return unless avatar.attached?

    unless avatar.byte_size <= 4.megabyte
      errors.add(:avatar, "is too big")
    end

    acceptable_types = ["image/jpeg", "image/png", "image/jpg"]
    unless acceptable_types.include?(avatar.content_type)
    errors.add(:avatar, "must be a JPEG, JPG or PNG")
    end
  end

  def avatar_thumbnail
    if avatar.attached?
      avatar.variant(resize_to_fill: [300, 300]).processed
    else
      '/default_profile.png'
    end
  end

  private

  def add_default_avatar
    unless avatar.attached?
      avatar.attach(
        io: File.open(
          Rails.root.join(
            'app', 'assets', 'images', 'default_profile.png'
          )
        ), 
        filename: 'default_profile.png', 
        content_type: 'image/png'
      )
    end
  end
end
