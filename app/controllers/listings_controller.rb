class ListingsController < ApplicationController
  before_filter :authenticate_user!, except: [:index]
  def index
    @listings = Listing.all
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(listing_params)
    respond_to do |format|
      format.html { redirect_to listings_url }
      format.js
    end
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
    params.require(:listing).permit(:title, :description, :address, :price, :user_id)
  end
end
