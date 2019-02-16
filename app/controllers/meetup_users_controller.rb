class MeetupUsersController < ApplicationController

    def create
        @meetup_user = MeetupUser.new 
        @meetup_user.meetup_location_id = join_params[:meetup_location]
        @meetup_user.user = current_user
        if current_user.meetup_users.where(meetup_location_id: "#{join_params[:meetup_location]}").present?
            flash[:primary] = "You are going to this Ping already!"
            redirect_to meetup_locations_path
        else
            if @meetup_user.save
                # client = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])
                # from = ENV['TWILIO_PHONE_NUMBER']
                # to = current_user.phone_number 
                # client.messages.create(
                #     from: from,
                #     to: to,
                #     body: "Someone joined your Ping!"
                # )
                redirect_to meetup_location_path(@meetup_user.meetup_location)
            else
                redirect_to root_path
            end
        end
    end
    private
    def join_params
        params.require(:meetup_user).permit(:meetup_location)
    end
end

