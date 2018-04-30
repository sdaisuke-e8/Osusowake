class PagesController < ApplicationController
  def home
  end

  def search
    if params[:search].present?

      if params["lat"].present? && params["lng"].present?
        @latitude = params["lat"]
        @longitude = params["lng"]

        geolocation = [@latitude, @longitude]
      else
        geolocation = Geocoder.coordinates(params[:search])
        @latitude = geolocation[0]
        @longitude = geolocation[1]
      end

      @listings = Listing.near(geolocation, 1, order: 'distance')
    else
      @listings = Listing.all
      @latitude = @listings.to_a[0].latitude
      @longitude = @listings.to_a[0].longitude
    end
  end

  def ajaxsearch
    # まずajaxで送られてきた緯度経度をセッションに入れる
    if !params[:geolocation].blank?
      geolocation = params[:geolocation]
  end

  @listings = Listing.near(geolocation, 1, order: 'distance')

  # リスティングデータを配列にしてまとめる
  @arrlistings = @listings.to_a

  respond_to :js

  end

end
