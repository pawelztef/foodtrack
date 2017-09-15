class AddImageUploadertoFposts < ActiveRecord::Migration
  def change
    add_column :fposts, :image, :string
  end
end
