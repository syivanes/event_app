namespace :venue_suggestions do
  desc "Generate venue suggestions for event form"
  task :index => :environment do
    VenueSuggestion.index_venues
  end
end
