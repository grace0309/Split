class PagesController < ApplicationController
  def home
    @posts = Post.all
    @posts_active = Post.where(status: true)
    @deals = Deal.all
    user_id = current_user.id
    @user = User.find(user_id)
    if params[:query].present?
      results = PgSearch.multisearch(params[:query])
      results.each do |result|
        if result.searchable_type == 'Post'
          post = Post.find(result.searchable_id)
          if post.status == true
            @posts << post
          end
        else
          deal = Deal.find(result.searchable_id)
          @deals << deal
        end
      end
    end
  end

  def dashboard
    @user = current_user
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
