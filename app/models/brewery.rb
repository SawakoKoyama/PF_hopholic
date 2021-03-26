class Brewery < ApplicationRecord
    belongs_to :user
    attachment :image
    
    has_many :favorites, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
    
    validates :brewery_name, presence: true
    #validates :body, presence: true, length: { maximum: 200 }
end
