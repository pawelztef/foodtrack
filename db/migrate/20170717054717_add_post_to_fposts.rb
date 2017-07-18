class AddPostToFposts < ActiveRecord::Migration
  def change
    add_reference :fposts, :post, index: true, foreign_key: true
  end
end
