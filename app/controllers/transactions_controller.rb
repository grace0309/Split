class TransactionsController < ApplicationController
  def index
    @transactions = Transaction.all
  end

  def show
  end

  def new
    @post = Post.find(params[:post_id])
    @transaction = Transaction.new(post: @post)
  end

  def create
    @post = Post.find(params[:post_id])
    @transaction = Transaction.new(post: @post)
  end

  def edit
  end

  def update
    @transaction.update(booking_params)
  end

  def destroy
    @transaction.destroy
  end

  private

  def set_post
    @transaction = Transaction.find(params[:id])
  end

  def post_params
    params.require(:transaction).permit()
  end
end
