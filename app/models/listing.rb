class Listing < ApplicationRecord
  belongs_to :user

  mount_uploader :listing_image, ImageUploader
end
