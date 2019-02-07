class CreateMeetupLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :meetup_locations do |t|
      t.float :meetup_latitude
      t.float :meetup_longitude
      t.boolean :active
      
      t.timestamps
    end
  end
end
