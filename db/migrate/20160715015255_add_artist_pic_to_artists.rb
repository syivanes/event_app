class AddArtistPicToArtists < ActiveRecord::Migration[5.0]
  def change
    add_column :artists, :artist_pic, :string
  end
end
