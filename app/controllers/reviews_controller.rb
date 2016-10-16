class ReviewsController < ApplicationController

  before_filter :authorize

  def create
    @product = Product.find(params[:product_id])
    @review = Review.new(review_params)
    @review.user = current_user
    @review.product_id = @product.id
    if @review.save
      redirect_to product_path(@product)
    else
      render :'products/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(
      :rating,
      :description
    )
  end

end
