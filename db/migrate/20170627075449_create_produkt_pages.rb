class CreateProduktPages < ActiveRecord::Migration
  def change
    create_table :produkt_pages do |t|

      t.timestamps null: false
    end
  end
end
