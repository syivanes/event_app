require 'bcrypt'
class User < ApplicationRecord
  include BCrypt
  attr_accessor :password
  before_save :encrypt_password

#  geocoded_by :ip_address
#  after_validation :geocode

  has_many :rsvps
  has_many :events, through: :rsvps

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_presence_of :username
  validates_uniqueness_of :username

  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

  def rsvp_for_event(event)
    Rsvp.where(:event_id => event.id).first
	end

end
