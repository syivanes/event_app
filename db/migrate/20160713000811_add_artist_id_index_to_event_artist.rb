class AddArtistIdIndexToEventArtist < ActiveRecord::Migration[5.0]
  def change
    add_index :event_artists, :artist_id
  end
end
