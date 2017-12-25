class CommentsController < ApplicationController
  before_action :set_post, only: [:index, :new, :create, :destroy]
  before_action :set_comment, only: [:destroy]

  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def destroy
    @comment.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:comment).permit(:name, :comment)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
end
