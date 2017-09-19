class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.string :subject
      t.text :body
      t.references :query, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
