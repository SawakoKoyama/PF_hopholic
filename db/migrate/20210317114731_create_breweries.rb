class CreateBreweries < ActiveRecord::Migration[5.2]
  def change
    create_table :breweries do |t|
      t.integer :user_id
      t.integer :prefecture_id
      t.integer :image_id
      t.string :brewery_name
      t.string :comment
      t.string :address
      t.string :star
      t.timestamps
    end
  end
end
