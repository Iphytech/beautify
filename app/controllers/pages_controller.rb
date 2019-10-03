class PagesController < ApplicationController
  def home
    @pics = Pic.all.order("created_at DESC")
  end

  def showcase
    @showcase = current_user.pics
  end
end
