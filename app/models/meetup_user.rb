class MeetupUser < ApplicationRecord
    belongs_to :user
    belongs_to :meetup_location
end
