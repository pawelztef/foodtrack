class AddFieldsToSettings < ActiveRecord::Migration
  def change
    add_column :settings, :motto_line1, :string
    add_column :settings, :motto_line2, :string
  end
end
