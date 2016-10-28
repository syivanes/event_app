class AddStatusColumnToRsvp < ActiveRecord::Migration[5.0]
  def change
    add_column(:rsvps, :status, :integer)
  end
end
