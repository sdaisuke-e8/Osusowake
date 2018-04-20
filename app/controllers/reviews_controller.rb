class ReviewsController < ApplicationController
  def create
    @review = current_user.reviews.create(review_params)
    redirect_to listings_path
  end

  def destroy
  end

  private
  def review_params
    params.require(:review).permit(:description, :rate, :listing_id)
  end
end
