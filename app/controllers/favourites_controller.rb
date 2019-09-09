class FavouritesController < ApplicationController
  def index
    @favourites = Favourite.all
  end

  def update
    favourite = Favourite.where(deal: Deal.find(params[:deal]), user: current_user)
    if favourite == []
      #create the favourite
      Favourite.create(deal: Deal.find(params[:deal]), user: current_user)
      @favourite_exists = true
    else
      #destroy the favourite
      favourite.destroy_all
      @favourite_exists = false
    end

    respond_to do |format|
      format.html {}
      format.js {}
    end
  end
end
