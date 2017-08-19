class AddFlagToQueries < ActiveRecord::Migration
  def change
    add_column :queries, :read, :boolean, default: false
  end
end
