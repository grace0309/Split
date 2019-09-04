class ReviewsController < ApplicationController
  before_action :find_review, only: [ :destroy, :edit, :update]
  before_action :new_review, only: [ :new, :create]

  def new
  end

  def create
    @review.user_id = current_user.id
    @review.content = review_params[:content]
    if @review.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @review.update(review_params)
    redirect_to root_path
  end

  def destroy
    @review.destroy
    redirect_to dashboard_path
  end

private
  def new_review
    @transaction = Transaction.find(params[:booking_id])
    @review = Review.new(transaction: @transaction)
  end

  def find_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:content)
  end
end
