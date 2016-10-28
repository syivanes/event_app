class Event < ApplicationRecord
  belongs_to :venue
  has_many :event_artists
  has_many :artists, through: :event_artists
  has_many :rsvps
  has_many :users, through: :rsvps
#  accepts_nested_attributes_for :event_artists, reject_if: :all_blank, allow_destroy: true

# scope :for_event, ->(event) { where(:event_id => event.id) }

  def title
    "#{self.name} with #{self.artists.map(&:name).join(", ")} at #{self.venue.name}"
  end
end
