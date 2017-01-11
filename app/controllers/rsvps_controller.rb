class RsvpsController < ApplicationController

  before_action :set_rsvp, only: [:update]
  skip_before_action :verify_authenticity_token


  def create
    @rsvp = Rsvp.new(rsvp_params)
    @rsvp.user = current_user
    if @rsvp.save
      render json: @rsvp, status: :created, location: [current_user, @rsvp]
    else
      render json: @rsvp.errors, status: :unprocessable_entity
    end
  end

  def update
    if @rsvp.update(rsvp_params)
      respond_to do |format|
        format.js
      end
    end
  end

private

  def set_rsvp
    @rsvp = Rsvp.find(params[:id])
  end

  def rsvp_params
    params.require(:rsvp).permit(:id, :event_id, :user_id, :status)
  end
end

