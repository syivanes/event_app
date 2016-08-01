module BeforeOrAfter
  attr_accessor :past
  attr_accessor :future

  require "date"
  def initialize
    @datetime = DateTime.new
    @future = []
    @past = []
  end

  def before_or_after(event)
    if event < DateTime.now
      @past << event.id
    else
      @future << event.id
    end
  end
end
