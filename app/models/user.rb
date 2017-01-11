require 'bcrypt'
class User < ApplicationRecord
  include BCrypt
  attr_accessor :password

  #geocoded_by :ip_address
  #after_validation :geocode

  has_many :rsvps
  has_many :events, through: :rsvps

  before_save :encrypt_password
  before_save :downcase_password

  validates :username, presence: true, length: { maximum: 50 }, uniqueness: { case_sensitive: false }, unless: :guest?
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 250 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }, unless: :guest?

  validates_confirmation_of :password, unless: :guest?
  validates_presence_of :password, :on => :create, unless: :guest?

  def self.authenticate(username_or_email, password)
      user = find_by_email(username_or_email) || find_by_username(username_or_email)

    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def self.new_guest
    new { |u| u.guest = true }
  end

  def move_to(user)
    tasks.update_all(user_id: user.id)
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

  private
  def downcase_password
    unless self.guest?
      self.email = email.downcase
    end
  end
end
