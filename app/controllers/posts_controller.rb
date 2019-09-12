class PostsController < ApplicationController
  before_action :set_post, only: [:show, :destroy, :edit, :update]

  def index
    @posts_true = Post.where(status: true)
    @posts_true.each { |post| post.check_if_expired }
    @posts = Post.all
  end

  def show
    #set your post
    @post.check_if_expired
    if @post.users.include?(current_user)
      @transaction = current_user.transactions.find_by(post: @post)
    else
      @transaction = Transaction.new
    end
    authorize @post
  end

  def new
    @post = Post.new
    authorize @post
  end

  def create
    @post = Post.new(post_params)
    authorize @post
    @post.total_contribution = @post.starting_contribution
    @post.user = current_user
    if @post.save
      redirect_to dashboard_path
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
    @post.save
    if @post.status == false
    elsif @post.save
      redirect_to dashboard_path
    else
      render :edit
    end
  end

  def destroy
    authorize @post
    @post.destroy
    @posts = Post.all
    redirect_to dashboard_path
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:store_name, :details, :discount, :quota, :starting_contribution, :units, :photo, :category_id, :start_time, :end_time, :status, :completed, :notify, :address)
  end

end
