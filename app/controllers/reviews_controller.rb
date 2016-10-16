class ReviewsController < ApplicationController

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

  # Never trust parameters from the scary internet, only allow the white list through.
  def review_params
    params.require(:review).permit(:rating, :description)
  end

end
