class CurrentLocationsController < ApplicationController

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
        # l = CurrentLocation.new
        # l.user_id = 1
        # l.address = "test"
        # l.latitude = "123.1234"
        # l.longitude = "123.1234"
        # l.save

        # redirect_to meetup_locations_path
        
        # @location = CurrentLocation.create user_id: 1, latitude: '123.12345', longitude: '123.12346'
        # new_location = CurrentLocation.create address_params
        # new_location.latitude = 123.1234
        # new_location.longitude = 123.1234
        # byebug
        # new_location.user = current_user
        # new_location[:latitude] = params[:current_location][:latitude].to_f
        # new_location[:longitude] = params[:current_location][:longitude].to_f
        # new_location.save
        # @location.latitude = 100.67878
        # @location.longitude = address_params[:longitude].to_f
        # @location.longitude = 200.6557
        # @location.user = current_user
        # @location.save
        puts '===================================='
        # puts address_params
        puts '===================================='
        # @location = new CurrentLocation
        # @location.latitude = address_params[:latitude]
        # @location.longitude = address_params[:longitude]

    end

    private
    def address_params
        params.require(:current_location).permit(:longitude, :latitude)
    end
end
