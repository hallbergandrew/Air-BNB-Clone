class ListingPhoto < ActiveRecord::Base
  belongs_to :listing
  has_attached_file :photo, :styles => { :large => "450x450#", :medium => "300x300#", :thumb => "100x100#" },
                            # :convert_options => { :thumb => "-quality 75 -strip" },
                            :default_url => "/images/:style/missing.png"

  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

end
