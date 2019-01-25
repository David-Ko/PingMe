class CreateMeetupLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :meetup_locations do |t|
      t.decimal :meetup_latitude, { precision: 10, scale: 6 }
      t.decimal :meetup_longitude, { precision: 10, scale: 6 }
      t.boolean :active
      
      t.timestamps
    end
  end
end
