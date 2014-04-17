class Listing < ActiveRecord::Base
  belongs_to :user
  has_many :listing_photos
  accepts_nested_attributes_for :listing_photos

  def self.text_search(query)
    if query.present?
      where("title ilike :q or description ilike :q", q: "%#{query}")
    else
      scoped
    end
  end
end
