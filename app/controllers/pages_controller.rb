class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
  end

  def about
    @disable_sidebar = true
    @post = Post.new
  end
end
