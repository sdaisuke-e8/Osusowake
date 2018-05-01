class UsersController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])
    @user_listings = @user.listings.where(complete: false)
  end
end
