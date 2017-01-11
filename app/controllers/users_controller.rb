class UsersController < ApplicationController
before_action :set_user, only: [:show, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = user_params ? @user = User.new(user_params) : User.new_guest
    if @user.save
      current_user.move_to(@user) if current_user && current_user.guest?
      session[:user_id] = @user.id
      redirect_to events_path, :notice => "Signed up!"
    else
      render "new"
    end
  end

  def show
    if @user.id = current_user.id
      redirect_to profile_path
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    unless User.new_guest
      params.require(:user).permit(:username, :email, :password, :password_confirmation, :password_salt, :password_hash)
    end
  end


end
