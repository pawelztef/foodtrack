class AddAddessDataToSettings < ActiveRecord::Migration
  def change
    add_column :settings, :address_line1, :string
    add_column :settings, :address_line2, :string
    add_column :settings, :email, :string
    add_column :settings, :phone, :string
  end
end
