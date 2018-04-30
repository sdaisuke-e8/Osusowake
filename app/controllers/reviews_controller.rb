class ReviewsController < ApplicationController

  def new
    @review = Review.new
    @listing = Listing.find(params[:listing_id])
  end

  def create
    @review = Review.create(review_params)
    @listing = Listing.find(@review.listing_id)
    @review.user_id = @listing.user_id
    @review.save

    @reservation = Reservation.find_by(listing_id: @listing.id)
    @reservation.destroy

    @complete = Complete.create(user_id: current_user.id, listing_id: @listing.id)
    @complete.save

    redirect_to listings_path
  end

  def destroy
  end

  private
  def review_params
    params.require(:review).permit(:description, :rate, :listing_id)
  end
end
