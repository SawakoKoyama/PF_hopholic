class RemoveStarFromBreweries < ActiveRecord::Migration[5.2]
  def change
    remove_column :breweries, :star, :string
  end
end
