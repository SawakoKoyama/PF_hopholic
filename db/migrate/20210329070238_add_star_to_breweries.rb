class AddStarToBreweries < ActiveRecord::Migration[5.2]
  def change
    add_column :breweries, :star, :float
  end
end
