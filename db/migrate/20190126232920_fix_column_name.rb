class FixColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :current_locations, :current_latitude, :latitude
    rename_column :current_locations, :current_longitude, :longitude
  end
end
