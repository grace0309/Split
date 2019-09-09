class PagesController < ApplicationController
  def home
    location = request.location
    @nearby_posts = Post.near([location.latitude, location.longitude], 1, units: :km)
    @posts = Post.all
    @deals = Deal.all
    user_id = current_user.id
    @user = User.find(user_id)
    @posts_active = Post.where(status: true)
  end

  def search
    user_id = current_user.id
    @user = User.find(user_id)
    if params[:query].present?
      @post_results = Post.global_search(params[:query])
      @deal_results = Deal.deal_search(params[:query])
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
