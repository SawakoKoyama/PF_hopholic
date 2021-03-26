class AddBreweryIdToFavorites < ActiveRecord::Migration[5.2]
  def change
    add_column :favorites, :brewery_id, :integer
  end
end
