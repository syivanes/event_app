class VenueSuggestionsController < ApplicationController
  def create
    VenueSuggestion.create(params[:venue_suggestion])
  end

  def index
    render json: VenueSuggestion.terms_for(params[:term])
  end

  private
		def venue_suggestion_params
			params.require(:venue_suggestion).permit(:term, :popularity, venues_attributes: [ :id, :name, :address ])
		end
end
