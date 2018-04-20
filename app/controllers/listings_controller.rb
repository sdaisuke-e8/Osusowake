class ListingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_listing, only: [:show, :edit, :update, :destroy]

  def index
    @listings = Listing.all
  end

  def show
    @reservation = Reservation.find_by(listing_id: params[:id])

    @review = Review.find_by(listing_id: params[:id])
    # binding.pry
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = current_user.listings.new(listing_params)
    if @listing.save
      redirect_to listings_path, notice: 'リスティングを作成しました'
    else
      flash.now[:alert] = 'リスティングの作成に失敗しました'
      render :new
    end
  end

  def edit
  end

  def update
    if @listing.update(listing_params)
      redirect_to listings_path, notice: 'リスティングを編集しました'
    else
      render :edit
    end
  end

  def destroy
    @listing.destroy
    redirect_to listings_path
  end

  private
  def listing_params
    params.require(:listing).permit(:listing_image, :listing_title, :listing_content, :address, :pickup_times)
  end

  def set_listing
    @listing = Listing.find(params[:id])
  end
end
