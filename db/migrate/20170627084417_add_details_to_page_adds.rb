class AddDetailsToPageAdds < ActiveRecord::Migration
  def change
    add_column :page_adds, :body, :text
  end
end
