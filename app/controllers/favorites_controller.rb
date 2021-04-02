class FavoritesController < ApplicationController
  def create
    @brewery = Brewery.find(params[:format])
    favorite = current_user.favorites.new(brewery_id: @brewery.id)
    favorite.save
  end

  def destroy
    @brewery = Brewery.find(params[:format])
    favorite = current_user.favorites.find_by(brewery_id: @brewery.id)
    favorite.destroy
  end

end
