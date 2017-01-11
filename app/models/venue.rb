class Venue < ApplicationRecord
  has_many :events
  geocoded_by :address
  after_validation :geocode

  def address
    [street, city, state, country].compact.join(', ')
  end

end
