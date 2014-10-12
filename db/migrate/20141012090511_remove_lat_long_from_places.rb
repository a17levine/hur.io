class RemoveLatLongFromPlaces < ActiveRecord::Migration
  def change
  	remove_column :places, :lat_long, :string
  end
end
