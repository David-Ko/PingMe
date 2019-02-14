class RemoveActiveFromMeetupLocations < ActiveRecord::Migration[5.2]
  def change
    remove_column :meetup_locations, :active
  end
end
