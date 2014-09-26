class AddLatLongToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :lat_long, :string
  end
end
