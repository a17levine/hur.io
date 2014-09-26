class AddNotesToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :notes, :text
  end
end
