class ReviewController < ApplicationController
  def index
    @reviews = Review.includes(:user).includes(:product).all.order("created_at DESC")
  end

  def new
    @review = Review.new
  end

  def create
    Review.create(create_params)
    redirect_to action: :index
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy if current_user.id == review.user_id
    redirect_to action: 'index'
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    review = Review.find(params[:id])
    review.update(create_params)
    redirect_to action: 'index'
  end

  private
  def create_params
    params.require(:review).permit(:impression, :product_id).merge(user_id:current_user.id)
  end

end

