class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :following, foreign_key: "follower_id", class_name: "Relationship"
  has_many :followers, foreign_key: "followed_id", class_name: "Relationship"
         
  has_one_attached :avatar    
  after_commit :add_default_avatar, on: %i[ create update ] 

  def avatar_thumbnail
    if avatar.attached?
      avatar.variant(resize: '200x200!').processed
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
