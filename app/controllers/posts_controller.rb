class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:show]

  def index
    @user = current_user
    if params[:tag]
      @user.posts = policy_scope(Post).tagged_with(params[:tag]).order(created_at: :desc)
      @title = params[:tag]
    elsif params[:search].present?
      @user.posts = policy_scope(Post).order(created_at: :desc).global_search(params[:search])
    else
      @user.posts = policy_scope(Post).order(created_at: :desc)
    end
  end

  def show
    authorize @post
    @comment = Comment.new
  end

  def new
    @post = Post.new
    authorize @post
    @disable_sidebar = true
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    authorize @post

    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def edit
    authorize @post
    @disable_sidebar = true
  end

  def update
    authorize @post
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    authorize @post
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :photo, :all_tags)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
