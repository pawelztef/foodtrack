class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :route_name
      t.string :driver
      t.string :track
      t.boolean :active
      t.text :description

      t.timestamps null: false
    end
  end
end
