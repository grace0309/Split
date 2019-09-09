class PagesController < ApplicationController
  def home
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
    @posts = Post.where(user: @user)
    @transactions = Transaction.where(user: @user)
  end

  def chats
    @user = current_user
    @posts = @user.posts
    @transactions = @user.transactions
  end
end
