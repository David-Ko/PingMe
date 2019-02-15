class ChangeTimeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :meetup_locations, :time, :date_time
  end
end
