class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.date :publish_date
      t.boolean :publish, default: false 
      t.timestamps null: false
    end
  end
end
