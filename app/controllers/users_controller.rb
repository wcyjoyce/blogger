class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:dashboard]

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to root_path
    else
      render :new
    end
  end

  def dashboard
    @user = User.find(params[:id])
    @posts = Post.all
    authorize @user
    @disable_sidebar = true
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
