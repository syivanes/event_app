class Rsvp < ApplicationRecord

  enum status: { not_interested: 0, interested: 1, attending: 2 }

  belongs_to :event
  belongs_to :user

end
