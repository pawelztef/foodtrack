class CreateKontaktPages < ActiveRecord::Migration
  def change
    create_table :kontakt_pages do |t|

      t.timestamps null: false
    end
  end
end
