class PagesController < ApplicationController
  def home
    @posts = Post.all
    @deals = Deal.all
    user_id = current_user.id
    @user = User.find(user_id)
    if params[:query].present?
      results = PgSearch.multisearch(params[:query])
      results.each do |result|
        if result.searchable_type == 'Post'
          post = Post.find(result.searchable_id)
          @posts << post
        else
          deal = Deal.find(result.searchable_id)
          @deals << deal
        end
      end
    end
  end
end
