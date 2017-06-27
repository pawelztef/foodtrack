class CreateBlogPages < ActiveRecord::Migration
  def change
    create_table :blog_pages do |t|

      t.timestamps null: false
    end
  end
end
