class Listing < ApplicationRecord
  belongs_to :user
  has_many :reservations

  mount_uploader :listing_image, ImageUploader

  geocoded_by :address
  after_validation :geocode, :if => :address_changed?
end
