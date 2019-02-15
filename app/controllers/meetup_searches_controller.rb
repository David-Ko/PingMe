class MeetupSearchesController < ApplicationController
     before_action :authenticate_user!
        
    def new
    end

    def index
        @user = current_user
        @distance = meetup_searches_params[:distance]
        @latitude = meetup_searches_params[:latitude]
        @longitude = meetup_searches_params[:longitude]
        @nearby_meetup_locations = MeetupLocation.near([@latitude, @longitude], @distance, units: :km).order(created_at: :desc)
        # @nearby_meetup_locations = @nearby_locations.where(date_time > Time.now)
        @meetup_user = MeetupUser.new
    end

    private

    def meetup_searches_params
        params.permit(:distance, :latitude, :longitude)
    end




end
