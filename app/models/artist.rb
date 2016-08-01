class Artist < ApplicationRecord
  has_many :event_artists
  has_many :events, through: :event_artists
  mount_uploader :artist_pic, ArtistPicUploader
end
