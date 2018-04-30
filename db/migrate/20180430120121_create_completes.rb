class CreateCompletes < ActiveRecord::Migration[5.1]
  def change
    create_table :completes do |t|
      t.references :user, foreign_key: true
      t.references :listing, foreign_key: true

      t.timestamps
    end
  end
end
