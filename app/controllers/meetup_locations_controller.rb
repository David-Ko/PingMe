# require 'net/http'
class MeetupLocationsController < ApplicationController
    before_action :authenticate_user!
    
    def index
        # current_location = CurrentLocation.where(user_id: current_user.id)
        # locations = CurrentLocation.where(city: 'Vancouver');
        # below not real code
        # @locations = locations.filter(where distance between current locatoin and location is withing search params)
    end

    



end
