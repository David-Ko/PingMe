class SearchesController < ApplicationController
    
    def index
    end

    def new
    end

    def google
        @meetup_location = MeetupLocation.new 
        @distance = params[:distance]
        @venue = params[:venue]
        @lng = params[:longitude]
        @lat = params[:latitude]
        
        places = RestClient.get("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{@lat},#{@lng}&radius=#{@distance}&type=#{@venue}&keyword=#{@venue}&key=YourAPIKey", {accept: :json})
        @places = JSON.parse places
        render :index
    end

    private
    def search_params
        params.permit(:distance, :venue, :time, :latitude, :longitude)
    end
end
