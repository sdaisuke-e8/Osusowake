class ReservationsController < ApplicationController

  def index
    @reservations = current_user.reservations
  end

  def create
    @reservation = current_user.reservations.new(listing_id: params[:listing_id])
    if @reservation.save
      redirect_to listings_path, notice:"予約が完了しました"
    end
  end

  def destroy
    @reservation = current_user.reservations.find_by(listing_id: params[:listing_id])
    @reservation.destroy
    redirect_to listings_path, notice:"予約をキャンセルしました"
  end

end
