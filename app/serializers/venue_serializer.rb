class VenueSerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :zip_code

  def name
    object.name
  end

  def address
    object.address
  end

  def zip_code
    object.zip_code
  end
end
