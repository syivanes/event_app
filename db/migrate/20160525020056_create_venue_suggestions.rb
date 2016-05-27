class CreateVenueSuggestions < ActiveRecord::Migration[5.0]
  def change
    create_table :venue_suggestions do |t|
      t.string :term

      t.timestamps
    end
  end
end
