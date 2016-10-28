class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def past_events
    self.events.select { |event| event.date < DateTime.now }
  end

  def future_events
    self.events.select { |event| event.date > DateTime.now }
  end

end
