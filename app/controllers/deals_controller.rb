class DealsController < ApplicationController
  before_action :set_deal, only: [:show]

  def index
    @deals = Deal.all
  end

  def show
    @favourite_exists = Favourite.where(deal: @deal, user: current_user) == [] ? false : true
  end

  private

  def set_deal
    @deal = Deal.find(params[:id])
  end
end
