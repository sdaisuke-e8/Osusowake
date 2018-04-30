class AddCompleteColumnToListing < ActiveRecord::Migration[5.1]
  def change
    add_column :listings, :complete, :boolean, default: false, null: false
  end
end
