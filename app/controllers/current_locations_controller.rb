class CurrentLocationsController < ApplicationController

    def new
        @location = CurrentLocation.new
    end

    def create
        @location = CurrentLocation.new
        @location.user = current_user
        @location.latitude = address_params[:latitude]
        @location.longitude = address_params[:longitude]
        #I need the long and lat from the AJAX response
        #get it out of the JSON
        
        # @location = CurrentLocation.create address_params
        @location.save
        redirect_to meetup_locations_path
        

    end

    private
    def address_params
        params.require(:current_location).permit(:longitude, :latitude)
    end
end
