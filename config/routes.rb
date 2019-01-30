Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

###########
# WELCOME #
###########
get("/", to: "welcome#index", as: :root)

#################################
# TO SIGN UP FOR A USER ACCOUNT #
#################################
resources :users, only: [:new, :create]

#######################
# TO LOG IN AS A USER #
#######################
resource :session, only: [:new, :create, :destroy]


resources :meetup_locations

resources :current_locations, only: [:new, :create]

end
