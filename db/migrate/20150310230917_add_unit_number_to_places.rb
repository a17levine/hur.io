class AddUnitNumberToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :unit_number, :string
  end
end
