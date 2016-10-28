class CreateRsvp < ActiveRecord::Migration[5.0]
  def change
    create_table :rsvps do |t|
      t.integer :user_id
      t.integer :event_id
      t.boolean :interested
      t.boolean :attending
    end
  end
end
