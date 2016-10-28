class RenameStatInRsvp < ActiveRecord::Migration[5.0]
  def change
    rename_column(:rsvps, :stat, :status)
  end
end
