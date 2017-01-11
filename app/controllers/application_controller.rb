class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_artists
  before_filter :check_session
  helper_method :current_user

  private
		def set_artists
			@artists = Artist.all
		end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def check_session
      unless current_user
        redirect_to root_path
      end
    end
end
