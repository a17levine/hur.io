class AddUserRemoteIpToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :user_remote_ip, :string
  end
end
