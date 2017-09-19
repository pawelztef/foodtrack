class CreateCustomMails < ActiveRecord::Migration
  def change
    create_table :custom_mails do |t|
      t.string :recipient_mail
      t.string :subject
      t.text :body

      t.timestamps null: false
    end
  end
end
