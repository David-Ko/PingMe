class AddColumnMeetupLocations < ActiveRecord::Migration[5.2]
  def change
    add_column :meetup_locations, :time, :time
    add_column :meetup_locations, :restaurant, :text
  end
end
