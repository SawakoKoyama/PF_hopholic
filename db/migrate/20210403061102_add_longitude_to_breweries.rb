class AddLongitudeToBreweries < ActiveRecord::Migration[5.2]
  def change
    add_column :breweries, :longitude, :float
  end
end
