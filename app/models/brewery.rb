class Brewery < ApplicationRecord
    belongs_to :user
    attachment :image
    
    validates :brewery_name, presence: true
    #validates :body, presence: true, length: { maximum: 200 }
end
