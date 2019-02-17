class SearchesController < ApplicationController
    
    def index
    end

    def new
    end

    def google
        @meetup_location = MeetupLocation.new 
        @distance = (params[:distance].to_i * 1000)
        @venue = params[:venue]
        @lng = params[:longitude] 
        @lat = params[:latitude] 
        
        @raw_places = RestClient.get("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{@lat},#{@lng}&radius=#{@distance}&type=#{@venue}&keyword=#{@venue}&key=#{ENV['GOOGLE_API_KEY']}", {accept: :json})
        @places = JSON.parse @raw_places
        render :index
    end

    private
    def search_params
        params.permit(:distance, :venue, :latitude, :longitude)
    end
end
