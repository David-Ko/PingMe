# require 'net/http'
class MeetupLocationsController < ApplicationController
    before_action :authenticate_user!
    
    def index
        # current_location = CurrentLocation.where(user_id: current_user.id)
        # locations = CurrentLocation.where(city: 'Vancouver');
        # below not real code
        # @locations = locations.filter(where distance between current locatoin and location is withing search params)
    end



    def create
        @meetup_location = MeetupLocation.new meetup_params
        @meetup_location.users << current_user
        if @meetup_location.save
            redirect_to meetup_location_path(@meetup_location)
        else
            redirect_to root_path
        end
    end

    def show
        @meetup_location = MeetupLocation.find params[:id]
    end


    private
    
    def meetup_params
        params.require(:meetup_location).permit(:place_name, :place_address, :place_lat, :place_lng, :time)
    end



end
