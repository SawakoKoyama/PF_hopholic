class BreweriesController < ApplicationController
  def index
    @breweries = Brewery.all
  end

  def show
  end

  def edit
  end

  def new
    @brewery = Brewery.new
  end

  def create
    @brewery = Brewery.new(brewery_params)
    #@brewery.user_id = current_user.id
    @brewery.save
    redirect_to breweries_path
  end

  def update
  end

  def destroy
  end

  private
  def brewery_params
    params.require(:brewery).permit(:brewery_name, :image, :prefecture_id, :address, :star, :comment, :user_id)
  end

end
