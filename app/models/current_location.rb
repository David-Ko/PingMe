class CurrentLocation < ApplicationRecord
    attr_accessor :address, :latitude, :longitude
    belongs_to :user
    geocoded_by :address
    after_validation :geocode
end
