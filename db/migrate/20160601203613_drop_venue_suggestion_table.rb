class DropVenueSuggestionTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :venue_suggestions
  end
end
