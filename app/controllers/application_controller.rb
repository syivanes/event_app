class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_artists
  #include BeforeOrAfter

  private
		def set_artists
			@artists = Artist.all
		end

    def prepare_events(model)
      (@past, @future) = model.events.partition { |event| event.time < DateTime.now }
      events
    end
end
