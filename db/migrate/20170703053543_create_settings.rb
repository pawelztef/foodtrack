class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.string :posts_on_wall

      t.timestamps null: false
    end
  end
end
