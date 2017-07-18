class RemoveFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :facebook
    remove_column :posts, :excerpt
    remove_column :posts, :fposts_id
  end
end
