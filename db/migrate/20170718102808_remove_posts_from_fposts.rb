class RemovePostsFromFposts < ActiveRecord::Migration
  def change
    remove_reference :fposts, :post, index: true, foreign_key: true
  end
end
