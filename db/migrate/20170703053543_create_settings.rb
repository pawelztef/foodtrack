class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.integer :posts_on_wall, default: 5
      t.integer :posts_on_gallery, default: 5
      t.string  :image

      t.timestamps null: false
    end
  end
end
