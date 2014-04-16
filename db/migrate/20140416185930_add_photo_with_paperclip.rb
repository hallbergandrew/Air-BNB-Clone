class AddPhotoWithPaperclip < ActiveRecord::Migration
  def change
    def self.up
      add_attachment :listing_photos, :photo
    end

    def self.down
      remove_attachment :listing_photos, :photo
    end
  end
end
