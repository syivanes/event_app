class DeleteAttendingAndInterestedInRsvp < ActiveRecord::Migration[5.0]
  def change
    remove_columns(:rsvps, :attending, :interested)
  end
end
