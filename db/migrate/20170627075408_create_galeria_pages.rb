class CreateGaleriaPages < ActiveRecord::Migration
  def change
    create_table :galeria_pages do |t|

      t.timestamps null: false
    end
  end
end
