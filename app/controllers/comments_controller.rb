class CommentsController < ApplicationController
  before_action :set_post, only: [:create]

  def create
    @comment = Comment.new(comment_params)
    authorize @post
    @comment.post = @post
    if @comment.save
      redirect_to post_path(@post)
    else
      render "posts/show"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:name, :comment)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end
