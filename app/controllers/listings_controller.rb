class ListingsController < ApplicationController
  before_filter :authenticate_user!, except: [:index]
  def index
    @listings = Listing.all

  end

  def new
    @listing = Listing.new
    @listing.listing_photos.build
  end

  def create
    @listing = Listing.new(listing_params)
    if @listing.save
      redirect_to listings_url
    else
      render 'new'
    end
    # respond_to do |format|
    #   format.html { redirect_to listings_url }
    #   format.js
  end

  def edit
    @listing = Listing.find(params[:id])
  end

  def update
    @listing = Listing.find(params[:id])
    @listing.update_attributes!(listing_params)
    respond_to do |format|
      format.html { redirect_to listings_url }
      format.js
    end
  end

  def show
    @listing = Listing.find(params[:id])
    @posting_user = User.find(@listing.user_id)
  end

  def destroy
    @listing = Lising.destroy(params[:id])
    respond_to do |format|
      format.html { redirect_to listings_url }
      format.js
    end
  end

  private
  def listing_params
    params.require(:listing).permit( :title, :description, :address, :city, :state, :zipcode, :price, :user_id, :id, :listing_photos_attributes => [:id, :caption, :listing_id, :photo])
  end
end
