class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :route_name
      t.string :driver
      t.string :truck
      t.boolean :active, default: false
      t.text :description

      t.timestamps null: false
    end
  end
end
