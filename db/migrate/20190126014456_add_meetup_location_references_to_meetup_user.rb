class AddMeetupLocationReferencesToMeetupUser < ActiveRecord::Migration[5.2]
  def change
    add_reference :meetup_users, :meetup_location, foreign_key: true
  end
end
