class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @posts = Post.all
  end

  def show
    authorize @post
  end

  def new
    @post = Post.new
    authorize @post
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    authorize @post

    if @post.save
      redirect_to post_path(@post)
    else
      render :enw
    end
  end

  def edit
    authorize @post
  end

  def destroy
    authorize @post
    @post.destroy
    redirect to root_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :photo)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
