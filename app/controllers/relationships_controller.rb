class RelationshipsController < ApplicationController

  def create
    @other_user = User.find(params[:follow])
    current_user.follow(@other_user)
    #redirect_to users_path
  end

  def destroy
    @other_user = User.find(params[:follow])
    current_user.unfollow(@other_user.id)
    #redirect_to users_path
  end

  private
  def relationship_params
  params.require(:relationship).permit(:relationship, :follow_id)
  end

end
