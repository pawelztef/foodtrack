class CreateSocialIcons < ActiveRecord::Migration
  def change
    create_table :social_icons do |t|

      t.timestamps null: false
    end
  end
end
