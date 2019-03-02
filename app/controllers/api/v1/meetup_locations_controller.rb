class Api::V1::MeetupLocationsController < Api::ApplicationController
    # before_action :authenticate_user!#, except: [:index, :show]

    def index
        meetup_locations = MeetupLocation.order(created_at: :desc)
        render json: meetup_locations
    end

    def show
        meetup_location = MeetupLocation.find params[:id]
        render json: meetup_location
    end

end
