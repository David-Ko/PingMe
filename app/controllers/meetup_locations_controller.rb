class MeetupLocationsController < ApplicationController
    before_action :find_meetup, only: [:show, :destroy]
    before_action :authenticate_user!
    before_action :authorized_user!, only: [:destroy]
    
    def index
        @user = current_user
        @meetup_locations = @user.meetup_locations.where("date_time >= ?", Time.now).order(created_at: :desc)
        @old_meetup_locations = @user.meetup_locations.where("date_time < ?", Time.now).order(created_at: :desc)
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

    def destroy
        @meetup_location = MeetupLocation.find params[:id]
        # client = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])
        # from = ENV['TWILIO_PHONE_NUMBER']
        # to = @meetup_location.users.last.phone_number 
        # client.messages.create(
        #     from: from,
        #     to: to,
        #     body: "Sorry, this Ping has been cancelled by host!"
        #     )
        @meetup_location.destroy
        flash[:primary] = "We're sorry to see that you deleted your Ping."
        redirect_to meetup_locations_path
    end

    private

    def find_meetup
        @meetup_location = MeetupLocation.find params[:id]
    end

    def meetup_params
        params.require(:meetup_location).permit(:place_name, :place_address, :latitude, :longitude, :date_time, :host_id)
    end

    def authorized_user!
        unless can?(:delete, @meetup_location)
            flash[:danger] = "You are not authorized!"
            redirect_to root_path
        end
    end
end
