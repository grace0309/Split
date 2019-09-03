class PostsController < ApplicationController
  before_action :set_post, only: [:show, :destroy, :edit, :update]

  def index
    @posts = Post.all
    @posts.each do |post|
      post.check_time
    end
  end

  def show
    authorize @post
  end

  def new
    @post = Post.new
    authorize @post
  end

  def create
    @post = Post.new(post_params)
    authorize @post
    @post.user = current_user
    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def edit
    authorize @post
  end

  def update
    authorize @post
    @post.update(post_params)
    @posts = Post.all
  end

  def destroy
    authorize @post
    @post.destroy
    @posts = Post.all
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:store_name, :details, :discount, :quota, :starting_contribution, :units, :photo, :category_id)
  end

end
