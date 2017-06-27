class CreatePageAdds < ActiveRecord::Migration
  def change
    create_table :page_adds do |t|
      t.integer :addable_id
      t.string :addable_type

      t.timestamps null: false
    end
  end
end
