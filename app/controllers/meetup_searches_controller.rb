class MeetupSearchesController < ApplicationController
    before_action :authenticate_user!
        
    def new
    end

    def index
        @user = current_user
        @distance = meetup_searches_params[:distance] 
        @latitude = meetup_searches_params[:latitude] ||= 49.282058
        @longitude = meetup_searches_params[:longitude] ||= -123.1084 
        @time_comparison = MeetupLocation.where("date_time > ?", Time.now).order(date_time: :asc)
        @nearby_meetup_locations = @time_comparison.near([@latitude, @longitude], @distance, units: :km)
        @meetup_user = MeetupUser.new
    end

    private

    def meetup_searches_params
        params.permit(:distance, :latitude, :longitude)
    end
end
