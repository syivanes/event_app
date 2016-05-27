class Artist < ApplicationRecord
  has_many :events, through: :event_artists
end
