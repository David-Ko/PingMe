class ChangeColumnType < ActiveRecord::Migration[5.2]
  def change
    remove_column :meetup_locations, :date_time, :time
    add_column :meetup_locations, :date_time, :datetime
  end
end
