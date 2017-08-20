class AddIconImageToSocialIcons < ActiveRecord::Migration
  def change
    add_column :social_icons, :image, :string
  end
end
