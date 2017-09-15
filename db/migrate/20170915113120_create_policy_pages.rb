class CreatePolicyPages < ActiveRecord::Migration
  def change
    create_table :policy_pages do |t|
      t.timestamps null: false
    end
  end
end
