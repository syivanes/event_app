class AddStatToRsvp < ActiveRecord::Migration[5.0]
  def change
    add_column :rsvps, :stat, :integer
  end
end
