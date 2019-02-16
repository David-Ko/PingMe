class MeetupSearchesController < ApplicationController
    before_action :authenticate_user!
        
    def new
    end

    def index
        @user = current_user
        @distance = meetup_searches_params[:distance] 
        @latitude = meetup_searches_params[:latitude] ||= 49.2820475
        @longitude = meetup_searches_params[:longitude] ||= -123.1084801
        @time_comparison = MeetupLocation.where("date_time > ?", Time.now)
        @nearby_meetup_locations = @time_comparison.near([@latitude, @longitude], @distance, units: :km).order(created_at: :desc)
        @meetup_user = MeetupUser.new
    end

    private

    def meetup_searches_params
        params.permit(:distance, :latitude, :longitude)
    end




end