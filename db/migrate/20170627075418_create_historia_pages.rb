class CreateHistoriaPages < ActiveRecord::Migration
  def change
    create_table :historia_pages do |t|

      t.timestamps null: false
    end
  end
end
