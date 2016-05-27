class EventSerializer < ActiveModel::Serializer
  attributes :name, :venue, :artists, :date

  def name
    object.name
  end

  def date
    object.date
  end

  def venue
    object.venue.name
  end

  def artists
    object.artists.map(&:name)
  end

end
