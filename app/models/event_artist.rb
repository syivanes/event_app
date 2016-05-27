class EventArtist < ApplicationRecord
  belongs_to :event, optional: true
  belongs_to :artist
end
