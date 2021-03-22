class ChangeImageIdFromUsers < ActiveRecord::Migration[5.2]
  def change
    change_column(:users, :image_id, :string)
    change_column(:breweries, :image_id, :string)
  end
end
