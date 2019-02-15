class MeetupLocationsController < ApplicationController
    before_action :authenticate_user!
    
    def index
        @user = current_user
        @meetup_locations = @user.meetup_locations.order(created_at: :desc)
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
        params.require(:meetup_location).permit(:place_name, :place_address, :latitude, :longitude, :date_time)
    end
end
