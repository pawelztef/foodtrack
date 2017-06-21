class CreateZapytanies < ActiveRecord::Migration
  def change
    create_table :zapytanies do |t|
      t.string :fullname
      t.string :email
      t.string :phone
      t.text :body

      t.timestamps null: false
    end
  end
end
