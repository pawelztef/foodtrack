class CreateFposts < ActiveRecord::Migration
  def change
    create_table :fposts do |t|
      t.string :title
      t.string :facebook_id
      t.string :link_url
      t.text :body

      t.timestamps null: false
    end
  end
end
