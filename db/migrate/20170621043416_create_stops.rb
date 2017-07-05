class CreateStops < ActiveRecord::Migration
  def change
    create_table :stops do |t|
      t.string :address_line1
      t.string :address_line2
      t.string :town
      t.string :code
      t.string :catchphrase, limit: 100
      t.boolean :active, default: false
      t.datetime :date 
      t.datetime :date_out
      t.references :track, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
