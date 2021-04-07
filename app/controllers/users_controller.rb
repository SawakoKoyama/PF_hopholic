class UsersController < ApplicationController
  def index
    @users = User.page(params[:page]).reverse_order
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
    @breweries = @user.breweries.all.page(params[:page]).per(9)
  end

  def edit
    @user = User.find(params[:id])
      if @user == current_user
        render "edit"
      else
        redirect_to user_path(current_user)
      end
  end

  def update
    @user = User.find(params[:id])
      if @user != current_user
        redirect_to user_path(current_user) and return
      end
      if @user.update(user_params)
        flash[:notice] = "User is successfully updated."
        redirect_to user_path(current_user)
      else
        render :edit
      end
  end

  def destroy
    @user = User.find(params[:id])
      if @user.destroy
        flash[:notice] = "User is successfully deleted."
        redirect_to root_path
      else
        render :edit
      end
  end

private
  def user_params
    params.require(:user).permit(:name, :image, :introduction)
  end

end


