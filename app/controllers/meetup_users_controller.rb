class MeetupUsersController < ApplicationController

    def create
        @meetup_location = params[:meetup_location]
        @meetup_user = MeetupUser.new 
        @meetup_user.meetup_location_id = join_params[:meetup_location]
        @meetup_user.user = current_user
        
        if @meetup_user.save
            client = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])
            from = ENV['TWILIO_PHONE_NUMBER']
            to = current_user.phone_number 
            client.messages.create(
                from: from,
                to: to,
                body: "Someone joined your Ping!"
            )
            redirect_to root_path
        else
            redirect_to root_path
        end
    end
    private
    def join_params
        params.require(:meetup_user).permit(:meetup_location)
    end
end

