class ReviewsController < ApplicationController

  def new
    @review = Review.new
    @listing = Listing.find(params[:listing_id])
  end

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
