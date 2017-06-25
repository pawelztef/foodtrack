class AddLongitudeAndLatitudeToStops < ActiveRecord::Migration
  def change
    add_column :stops, :latitude, :float
    add_column :stops, :longitude, :float
  end
end
