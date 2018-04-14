class ListingsController < ApplicationController
  before_action :authenticate_user!

  def index
    @listings = Listing.all
  end

  def show
    @listing = Listing.includes(:user).find(params[:id])
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
    @listing = Listing.find_by(id: params[:id])
  end

  def update
    @listing = Listing.find_by(id: params[:id])
    @listing.listing_image = params[:listing][:listing_image]
    @listing.listing_title = params[:listing][:listing_title]
    @listing.listing_content = params[:listing][:listing_content]
    if @listing.save
      redirect_to listings_path, notice: 'リスティングを編集しました'
    else
      render :edit
    end
  end

  def destroy
    @listing = Listing.find_by(id: params[:id])
    @listing.destroy
    redirect_to listings_path
  end

  private
  def listing_params
    params.require(:listing).permit(:listing_image, :listing_title, :listing_content)
  end
end
