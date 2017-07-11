class CreateFposts < ActiveRecord::Migration
  def change
    create_table :fposts do |t|
      t.string :facebook_id
      t.text :body

      t.timestamps null: false
    end
  end
end
