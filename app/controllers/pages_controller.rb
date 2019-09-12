class PagesController < ApplicationController
  def home
    @posts = Post.all
    @deals = Deal.all
    user_id = current_user.id
    @user = User.find(user_id)
    @posts_active = Post.where(status: true)
  end

  def search
    if params[:query].present?
      @post_results = Post.global_search(params[:query])
      @deal_results = Deal.deal_search(params[:query])
    elsif params[:location].present? && params[:location][:lat] != '' && params[:location][:long] != ''
      place = Geocoder.search([params[:location][:lat], params[:location][:long]]).first.suburb
      @place = place
      @location_greeting = "You are searching in"
      @post_results = Post.near([params[:location][:lat], params[:location][:long]], 1)
    else
      redirect_to root_path
    end
  end

  def dashboard
    @user = current_user
    @posts = Post.where(status: true)
    @posts.each { |post| post.check_if_expired }
    @ongoing_posts = Post.where(user: @user, status: true)
    @ongoing_transactions = @user.joined_posts.where(status: true)
    @expired_posts = Post.where(user: @user, status: false)
    @expired_transactions = @user.joined_posts.where(status: false)
    @all_expired = @expired_posts + @expired_transactions
  end

  def chats
    @user = current_user
    posts = @user.posts.pluck(:id)
    joined_posts = @user.joined_posts.pluck(:id)
    @posts = Message.where(post_id: (posts + joined_posts)).order(created_at: :desc).pluck(:post_id).uniq
  end
end
