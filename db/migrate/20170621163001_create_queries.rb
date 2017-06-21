class CreateQueries < ActiveRecord::Migration
  def change
    create_table :queries do |t|
      t.string :fullname
      t.string :email
      t.string :phone
      t.text :body

      t.timestamps null: false
    end
  end
end
