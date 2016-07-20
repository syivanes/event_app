class AddArtistIdToEventArtist < ActiveRecord::Migration[5.0]
  def change
    add_column :event_artists, :artist_id, :integer
  end
end
