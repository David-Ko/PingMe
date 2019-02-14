class MeetupLocation < ApplicationRecord
    # attribute_accessor :place_name
    # belongs_to :host, class: User
    # belongs_to :guest, class: User
    has_many :meetup_users, dependent: :destroy
    has_many :users, through: :meetup_users, dependent: :nullify



    
end
