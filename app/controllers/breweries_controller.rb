class BreweriesController < ApplicationController
  def index
    @breweries = Brewery.search(params[:prefecture_id]).all.page(params[:page]).per(8)
  end

  def show
    @brewery = Brewery.find(params[:id])
    @user = @brewery.user
  end

  def edit
    @brewery = Brewery.find(params[:id])
  end

  def new
    @brewery = Brewery.new
  end

  def create
    @brewery = Brewery.new(brewery_params)
    @brewery.user_id = current_user.id
      if @brewery.save
        flash[:notice] = "Brewery is successfully created."
        redirect_to breweries_path
      else
        @breweries = Brewery.all
        @user = current_user
        render :new
      end
  end

  def update
    @brewery = Brewery.find(params[:id])
      if @brewery.update(brewery_params)
        flash[:notice] = "Brewery is successfully updated."
        redirect_to brewery_path(@brewery)
      else
        render :edit
      end
  end

  def destroy
    @brewery = Brewery.find(params[:id])
      if @brewery.destroy
        flash[:notice] = "Brewery is successfully deleted."
        redirect_to user_path(current_user)
      else
        render :show
      end
  end

  private
    def brewery_params
      params.require(:brewery).permit(:brewery_name, :image, :prefecture_id, :address, :star, :comment, :user_id)
    end

end
