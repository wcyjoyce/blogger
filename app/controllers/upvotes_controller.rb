class UpvotesController < ApplicationController
  before_action :set_post, only: [:new, :create]
  before_action :set_user, only: [:index, :new, :create]
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @upvotes = policy_scope(Upvote).order(created_at: :desc)
  end

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
      redirect_to root_path, alert: "You have already upvoted!"
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
