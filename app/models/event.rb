class Event < ApplicationRecord
  belongs_to :venue
  has_many :event_artists
  has_many :artists, through: :event_artists
  accepts_nested_attributes_for :event_artists, reject_if: :all_blank, allow_destroy: true

end