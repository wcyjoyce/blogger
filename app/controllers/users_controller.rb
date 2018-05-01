class UsersController < ApplicationController
  before_action :set_user, only: [:dashboard, :newsfeed, :following, :followers]
  skip_before_action :authenticate_user!, only: [:dashboard]

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to dashboard_path(@user)
    else
      render :new
    end
  end

  def dashboard
    @posts = Post.all
    @upvotes = Upvote.all
    @comments = Comment.all
    authorize @user
    @disable_sidebar = true
  end

  def newsfeed
    @users = @user.following
    authorize @user
  end

  def following
    @title = "Following"
    @users = @user.following
    render "show"
    authorize @user
  end

  def followers
    @title = "Followers"
    @users = @user.followers
    render "show"
    authorize @user
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :bio, :website, :linkedin, :twitter)
  end
end

