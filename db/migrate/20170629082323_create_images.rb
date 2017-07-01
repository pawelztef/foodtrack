class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :image
      t.string :image_title

      t.timestamps null: false
    end
  end
end
