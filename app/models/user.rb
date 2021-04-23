class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :following, foreign_key: "follower_id", class_name: "Relationship"
  has_many :followers, foreign_key: "followed_id", class_name: "Relationship"
         
  has_one_attached :avatar     
  
  def avatar_thumbnail
    if avatar.attached?
      avatar.variant(resize: '150x150!').processed
    else
      '/default_profile.png'
    end
  end

end
