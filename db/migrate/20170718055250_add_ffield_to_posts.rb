class AddFfieldToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :facebook, :boolean, default: false
  end
end
