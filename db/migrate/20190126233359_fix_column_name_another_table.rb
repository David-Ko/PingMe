class FixColumnNameAnotherTable < ActiveRecord::Migration[5.2]
  def change
    rename_column :meetup_locations, :meetup_latitude, :latitude
    rename_column :meetup_locations, :meetup_longitude, :longitude
  end 
end
