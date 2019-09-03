class TransactionsController < ApplicationController
  before_action :find_transaction, only: [:show, :destroy, :edit, :update]
  before_action :find_post, only: [:new, :create]
  # before_action :active?

  def show
  end

  def new
    @transaction = Transaction.new(post: @post)
  end

  def create
    @user = current_user
    @transaction = Transaction.new(post: @post, user: @user)
    if @transaction.update(transaction_params)
      add_contribution
    else
      render :new
    end
  end

  def edit
    @post = @transaction.post
  end

  def update
    @post = @transaction.post
    delete_contribution
    @transaction.update(transaction_params)
    add_contribution
  end

  def destroy
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
