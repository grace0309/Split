class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @deals = Deal.all
    @posts = Post.all
  end
end
