class PostsController < ApplicationController
  before_action :set_post, only: [:show, :destroy, :edit, :update]

  def index
    @posts = Post.all
    @posts.each do |post|
      post.check_time
    end
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.category_id = params[:post][:category_id]
    @post.user_id = current_user.id
    @post.save
    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
    @posts = Post.all
  end

  def edit
  end

  def update
    @post.update(post_params)
    @posts = Post.all
  end

  def destroy
    @post.destroy
    @posts = Post.all
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:store_name, :details, :discount, :quota, :starting_contribution, :units, :photo)
  end

end
