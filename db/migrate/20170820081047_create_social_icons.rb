class CreateSocialIcons < ActiveRecord::Migration
  def change
    create_table :social_icons do |t|
      t.string :url_address
      t.belongs_to :setting
      t.timestamps null: false
    end
  end
end
