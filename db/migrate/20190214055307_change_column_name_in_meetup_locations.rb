class ChangeColumnNameInMeetupLocations < ActiveRecord::Migration[5.2]
  def change
    rename_column :meetup_locations, :place_lat, :latitude
    rename_column :meetup_locations, :place_lng, :longitude
  end
end
