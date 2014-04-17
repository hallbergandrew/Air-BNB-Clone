class Listing < ActiveRecord::Base
  belongs_to :user
  has_many :listing_photos
  accepts_nested_attributes_for :listing_photos

end
