class CreateListings < ActiveRecord::Migration[5.1]
  def change
    create_table :listings do |t|
      t.string :listing_title
      t.text :listing_content
      t.string :listing_image
      t.string :address
      t.string :pickup_times
      t.references :user

      t.timestamps
    end
  end
end
