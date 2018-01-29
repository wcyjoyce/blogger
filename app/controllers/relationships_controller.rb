class RelationshipsController < ApplicationController
  skip_before_action :authenticate_user!

  def create
    user = User.find(params[:followed_id])
    current_user.follow(user)
    redirect_to dashboard_path(user), notice: "Followed!"
    authorize user
  end

  def destroy
    user = Relationship.find(params[:id]).following
    current_user.unfollow(user)
    redirect_to dashboard_path(user), alert: "Unfollowed!"
    authorize user
  end
end
