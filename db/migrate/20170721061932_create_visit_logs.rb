class CreateVisitLogs < ActiveRecord::Migration
  def change
    create_table :visit_logs do |t|
      t.integer :user_id
      t.string :fullname
      t.string :ip
      t.datetime :log_in
      t.datetime :log_out

      t.timestamps null: false
    end
  end
end
