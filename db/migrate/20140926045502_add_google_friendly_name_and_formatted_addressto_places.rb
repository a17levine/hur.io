class AddGoogleFriendlyNameAndFormattedAddresstoPlaces < ActiveRecord::Migration
  def change
  	add_column :places, :google_friendly_name, :string
  	add_column :places, :formatted_address, :string
  end
end
