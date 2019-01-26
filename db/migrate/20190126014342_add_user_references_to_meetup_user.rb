class AddUserReferencesToMeetupUser < ActiveRecord::Migration[5.2]
  def change
    add_reference :meetup_users, :user, foreign_key: true
  end
end
