class RemoveArtistIdFromEventArtists < ActiveRecord::Migration[5.0]
  def change
    remove_column :event_artists, :artist_id
  end
end
