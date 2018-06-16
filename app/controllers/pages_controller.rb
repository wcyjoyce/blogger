class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
    @disable_sidebar = true
    @posts = Post.all.order(created_at: :desc)
  end

  def about
    @disable_sidebar = true
    @message = Message.new
  end
end
