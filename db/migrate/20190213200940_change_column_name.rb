class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :meetup_locations, :latitude, :place_lat
    rename_column :meetup_locations, :longitude, :place_lng
    rename_column :meetup_locations, :restaurant, :place_name
  end
end
