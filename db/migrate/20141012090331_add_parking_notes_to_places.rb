class AddParkingNotesToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :parking_notes, :string
  end
end
