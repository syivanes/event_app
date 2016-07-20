class Artist < ApplicationRecord
  has_many :events, through: :event_artists
  mount_uploader :artist_pic, ArtistPicUploader
end
