class CreateKontaktKateringPages < ActiveRecord::Migration
  def change
    create_table :kontakt_katering_pages do |t|

      t.timestamps null: false
    end
  end
end
