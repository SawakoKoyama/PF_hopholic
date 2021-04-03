class AddLatitudeToBreweries < ActiveRecord::Migration[5.2]
  def change
    add_column :breweries, :latitude, :float
  end
end
