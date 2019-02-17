class CurrentLocation < ApplicationRecord
    attr_accessor :latitude
    attr_accessor :longitude
    # validates :latitude, :longitude, presence: true
    belongs_to :user
    geocoded_by :address
    after_validation :geocode
end
