class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :image

  validates :name, presence: true, uniqueness: true,
    length: { minimum: 2, maximum: 20 }
  validates :introduction, length: { maximum: 50 }

  has_many :breweries, dependent: :destroy
  has_many :relationships, dependent: :destroy
  has_many :followings, through: :relationships, source: :follow
  has_many :passive_relationships, class_name: 'Relationship', foreign_key: 'follow_id', dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :user
  has_many :favorites, dependent: :destroy

  def follow(other_user)
    return if self == other_user
    relationships.find_or_create_by!(follow: other_user)
  end

  def following?(user)
    followings.include?(user)
  end

  def unfollow(relathinoship_id)
    relationships.find_by(follow: relathinoship_id).destroy!
  end
end

