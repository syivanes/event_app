class VenuesController < ApplicationController
  def index
    @venues = Venue.order(:name).where("name ilike ? OR address ilike ?", "%#{params[:term]}%", "%#{params[:address]}%")
    render json: @venues.map(&:name)
    render json: @venues.map(&:address)
  end
end
