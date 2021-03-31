class Brewery < ApplicationRecord
    belongs_to :user
    attachment :image

    has_many :favorites, dependent: :destroy

    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :prefecture

  def self.search(search)
    return Brewery.all unless search
    Brewery.where(prefecture_id: search)
  end

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

    validates :brewery_name, presence: true
    #validates :body, presence: true, length: { maximum: 200 }
end
