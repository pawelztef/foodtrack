class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.integer :posts_on_wall
      t.integer :posts_on_gallery
      t.string  :image

      t.timestamps null: false
    end
  end
end
