class SessionsController < ApplicationController
    def new
    end

    def create
        user = User.find_by_email params[:email]
        if user&.authenticate(params[:password]) 
            session[:user_id] = user.id 
            flash[:primary] = "Welcome, #{user.first_name}!"
            redirect_to meetup_locations_path
        else
            flash[:primary] = "email or password wrong"
            render :new
        end
    end

    def destroy
        user = User.find_by_id(session[:user_id])
        session[:user_id] = nil
        flash[:primary] = "See you next time, #{user.first_name}."
        redirect_to root_path
    end

end
