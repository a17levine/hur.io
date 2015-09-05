class AddAttachmentMainPhotoToPlaces < ActiveRecord::Migration
  def self.up
    change_table :places do |t|
      t.attachment :main_photo
    end
  end

  def self.down
    remove_attachment :places, :main_photo
  end
end
