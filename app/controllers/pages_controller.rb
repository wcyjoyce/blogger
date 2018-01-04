class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
  end

  def contact
    @disable_sidebar = true
  end
end
