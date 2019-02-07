class ApplicationController < ActionController::Base
    # before_action :cors_set_access_control_headers
    private
    
    def current_user
        if session[:user_id].present?
        @current_user ||= User.find_by(id: session[:user_id])
        end
    end
    helper_method(:current_user)

    def user_signed_in?
        current_user.present?
    end
    helper_method(:user_signed_in?)

    def authenticate_user!
        unless user_signed_in?
            flash[:danger] = "you must sign in or sign up"
            redirect_to new_session_path
        end
    end

    # def cors_set_access_control_headers
    #     headers["Access-Control-Allow-Origin"] = "*"
    #     headers["Access-Control-Allow-Methods"] = "POST, PUT, DELETE, GET, PATCH, OPTIONS"
    #     headers["Access-Control-Request-Method"] = "*"
    #     headers["Access-Control-Allow-Headers"] = "Origin, X-Requested-With, Content-Type, Accept, Authorization"
    # end
end
