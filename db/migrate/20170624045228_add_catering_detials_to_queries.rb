class AddCateringDetialsToQueries < ActiveRecord::Migration
  def change
    add_column :queries, :from_date, :date
    add_column :queries, :to_date, :date
    add_column :queries, :town, :string
    add_column :queries, :catering_flag, :boolean, defaul: false
  end
end
