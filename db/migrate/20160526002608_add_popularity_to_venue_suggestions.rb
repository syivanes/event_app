class AddPopularityToVenueSuggestions < ActiveRecord::Migration[5.0]
  def change
    add_column :venue_suggestions, :popularity, :integer
  end
end
