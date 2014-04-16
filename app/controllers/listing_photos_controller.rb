class ListingPhotosController < ApplicationController

def new
  @listing_photo = Listing_photo.new
  @listing = Listing.find(params[:listing_id])
 end

def create
  @listing_photo = Listing_photo.new( listing_photo_params )
    if @listing_photo.save
      redirect_to listing_url(@listing_photo.listing_id)
    else
      render 'new'
    end
end

private

# Use strong_parameters for attribute whitelisting
# Be sure to update your create() and update() controller methods.

def listing_photo_params
  params.require(:listing_photo).permit(:photo, :caption, :listing_id)
end
end
