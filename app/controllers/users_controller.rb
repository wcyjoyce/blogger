class UsersController < ApplicationController
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
    @user = User.find(params[:id])
    @posts = Post.all
    @upvotes = Upvote.all
    authorize @user
    @disable_sidebar = true
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :bio, :website, :linkedin, :twitter)
  end
end
