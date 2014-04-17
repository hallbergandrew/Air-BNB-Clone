class Listing < ActiveRecord::Base
  belongs_to :user
  has_many :listing_photos
  accepts_nested_attributes_for :listing_photos

  before_save :capitalize_all

  def capitalize_all
    self.title = self.title.titleize
    self.city.capitalize!
    self.state.capitalize!
    self.description.capitalize!
    self.address = self.address.titleize
  end

  def self.text_search(query)
    if query.present?
      where("title @@ :q or description @@ :q or state @@ :q or city @@ :q", q: query)
    else
      scoped
    end
  end
end
