require 'spec_helper'

describe Listing do
  it {should have_many :listing_photos}
end
