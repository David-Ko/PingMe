class AddColumnToMeetupLocations < ActiveRecord::Migration[5.2]
  def change
    add_column :meetup_locations, :place_address, :text
  end
end
