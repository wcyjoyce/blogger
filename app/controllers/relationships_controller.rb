class RelationshipsController < ApplicationController
  # skip_before_action :authenticate_user!

  def create
    user = User.find(params[:followed_id])
    current_user.follow(user)
    authorize user
  end

  def destroy
    user = Relationship.find(params[:id]).following
    current_user.unfollow(user)
    authorize user
  end
end
