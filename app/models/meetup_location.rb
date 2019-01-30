class MeetupLocation < ApplicationRecord
    belongs_to :host, class: User
    belongs_to :guest, class: User


    
end
