module BeforeOrAfter
  attr_accessor :past
  attr_accessor :future

  require "date"
  def initialize
    @future = []
    @past = []
  end

  def before_or_after(event)
    if event.date < DateTime.now
      @past << event.id
    else
      @future << event.id
    end
  end
end
