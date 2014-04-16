class AddPhotoListingPhotosWithoutChange < ActiveRecord::Migration
 def self.up
    add_attachment :listing_photos, :photo
  end

  def self.down
    remove_attachment :listing_photos, :photo
  end
end

