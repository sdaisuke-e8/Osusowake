class ReservationsController < ApplicationController

  def index
    @reservations = current_user.reservations
  end

  def create
    @reservation = current_user.reservations.new(listing_id: params[:listing_id])
    @listing = Listing.find_by(id: params[:listing_id])

    if Conversation.find_by(sender_id: current_user.id, recipient_id: @listing.user_id).present?
      # Conversationテーブルの先頭のレコードを取得する
      @conversation = Conversation.find_by(sender_id: current_user.id, recipient_id: @listing.user_id)
    else
      @conversation = Conversation.create(sender_id: current_user.id, recipient_id: @listing.user_id)
    end

    if @reservation.save
      redirect_to conversation_messages_path(@conversation), notice:"予約が完了しました"
    end
  end

  def destroy
    @reservation = current_user.reservations.find_by(listing_id: params[:listing_id])
    @reservation.destroy
    redirect_to listings_path, notice:"予約をキャンセルしました"
  end

end
