class CurrentLocationsController < ApplicationController
    before_action :authenticate_user!
    def new
        @current_location = CurrentLocation.new
    end
    
    def create
        @current_location = CurrentLocation.create address_params
        @current_location.user = current_user
        if @current_location.save
            redirect_to meetup_locations_path
        else
            render :new
        end
    end

    private
    def address_params
        params.require(:current_location).permit(:longitude, :latitude)
    end
end
