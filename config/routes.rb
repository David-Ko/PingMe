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

# post("/search", to: "searches#index", as: :search)
resources :searches
get('/google_search', to: "searches#google", as: :google_search)

resources :meetup_searches

resources :meetup_users

resources :instructions
get('/how_to', to: "instructions#how_to", as: :how_to)

namespace :api, defaults: {format: :json} do
  namespace :v1 do
    resources :users, only: [] do
      get :current, on: :collection 
    end
    resources :meetup_locations
    resource :session, only: [:create, :destroy]
  end
end


end
