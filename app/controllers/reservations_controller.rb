class ReservationsController < ApplicationController

  def create
    @reservation = current_user.reservations.new(listing_id: params[:id])
    if @reservation.save
      redirect_to listings_path, notice:"予約が完了しました"
    end
  end

end
