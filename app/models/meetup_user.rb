class MeetupUser < ApplicationRecord
    belongs_to :user
    belongs_to :meetup_location
    
    # validate :already_joined?

#   private 
#   def already_joined?
#     if sender_id == receiver_id
#         flash[:danger] = "You are already in this Ping!"
#     end
#   end
end
