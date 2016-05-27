class VenueSuggestion < ApplicationRecord

#  has_many :venues
#  accepts_nested_attributes_for :venues

  def self.terms_for(prefix)
    suggestions = where("term like ?", "#{prefix}_%")
    suggestions.order("popularity desc").limit(10).pluck(:term)
  end

  def self.index_venues
    Venue.find_each do |venue|
      index_term(venue.name)
      index_term(venue.address)
      venue.name.split.each { |t| index_term(t) }
    end
  end

  def self.index_term(term)
    where(term: term.downcase).first_or_initialize.tap do |suggestion|
      suggestion.increment! :popularity
    end
  end
end
