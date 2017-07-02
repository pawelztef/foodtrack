class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :slug
      t.string :price
      t.text :description
      t.text :catchphrase
      t.string :image
      t.boolean :publish
      t.boolean :expose

      t.timestamps null: false
    end
  end
end
