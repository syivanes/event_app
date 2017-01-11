class SessionsController < ApplicationController

  before_action :require_login, only: [:show]

  def new
  end

  def create
    user = User.authenticate(params[:username_or_email], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to profile_path, :notice => "Logged in!"
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end

  def show
		@request = Rack::Request.new({'REMOTE_ADDR' => '107.128.188.218'})
		@location = @request.location
  end

  def destroy
    session[:user_id] = nil
    redirect_to events_path, :notice => "Logged out!"
  end

  def require_login
    unless current_user
      flash[:error] = "Please log in to access your account"
      redirect_to log_in_path
    end
  end
end
