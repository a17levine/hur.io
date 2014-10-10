class RemoveUrlFromPlaces < ActiveRecord::Migration
  def change
  	remove_column :places, :url , :string
  end
end
