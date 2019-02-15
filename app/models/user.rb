class User < ApplicationRecord
    has_many :meetup_users, dependent: :destroy
    has_many :meetup_locations, through: :meetup_users, dependent: :nullify
    
    has_secure_password

    validates :email, presence: true,
                      uniqueness: true,
                      format: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
end

