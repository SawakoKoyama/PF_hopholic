class FavoritesController < ApplicationController
  def create
    brewery = Brewery.find(params[:brewery_id])
    favorite = current_user.favorites.new(brewery_id: brewery.id)
    favorite.save
    redirect_to brewery_path(brewery)
  end

  def destroy
    brewery = Brewery.find(params[:brewery_id])
    favorite = current_user.favorites.find_by(brewery_id: brewery.id)
    favorite.destroy
    redirect_to brewery_path(brewery)
  end



end
