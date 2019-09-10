class TransactionsController < ApplicationController
  before_action :find_transaction, only: [:show, :destroy, :edit, :update]
  before_action :find_post, only: [:new, :create]
  # before_action :active?

  def show
    authorize @transaction
  end

  def new
    @transaction = Transaction.new(post: @post)
    authorize @transaction
  end

  def create
    @user = current_user
    @transaction = Transaction.new(post: @post, user: @user)
    authorize @transaction
    if @transaction.update(transaction_params)
      add_contribution
      redirect_to post_messages_path(@post)
    else
      render :new
    end
  end

  def edit
    authorize @transaction
    @post = @transaction.post
  end

  def update
    authorize @transaction
    @post = @transaction.post
    delete_contribution
    if @transaction.update(transaction_params)
      add_contribution
      redirect_to post_messages_path(@post)
    end
  end

  def destroy
    authorize @transaction
    @post = @transaction.post
    delete_contribution
    @transaction.destroy
  end

  private

  def find_transaction
    @transaction = Transaction.find(params[:id])
  end

  def find_post
    @post = Post.find(params[:post_id])
  end

  def add_contribution
    @post.total_contribution += @transaction.contribution
    if @post.completed == false && @post.status == true
      if @post.check_if_post_complete?
        @post.completed = true
        @post.notify = true
      end
    end
    @post.save
  end

  def delete_contribution
    @post.total_contribution -= @transaction.contribution
    @post.save
  end

  def transaction_params
    params.require(:transaction).permit(:contribution)
  end
end
