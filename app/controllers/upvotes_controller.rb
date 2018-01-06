class UpvotesController < ApplicationController
  before_action :set_post, only: [:new, :create]
  before_action :set_user, only: [:new, :create]

  def new
    @upvote = Upvote.new
    authorize @upvote
  end

  def create
    @upvote = Upvote.new(upvote_params)
    @upvote.post = @post
    @upvote.user = current_user
    authorize @upvote
    if @upvote.save
      redirect_to root_path, notice: "Thanks for upvoting!"
    else
      redirect_to root_path, notice: "You have already upvoted!"
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_user
    @user = current_user
  end

  def upvote_params
    params.require(:upvote).permit(:upvote)
  end
end
