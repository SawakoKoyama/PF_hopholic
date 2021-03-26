class RemoveImageIdFromFavorites < ActiveRecord::Migration[5.2]
  def change
    remove_column :favorites, :image_id, :integer
  end
end
