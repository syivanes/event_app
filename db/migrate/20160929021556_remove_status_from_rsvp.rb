class RemoveStatusFromRsvp < ActiveRecord::Migration[5.0]
  def change
    remove_column :rsvps, :status
  end
end
