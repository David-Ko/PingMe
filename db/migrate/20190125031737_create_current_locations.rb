class CreateCurrentLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :current_locations do |t|
      t.decimal :current_latitude, { precision: 10, scale: 6 }
      t.decimal :current_longitude, { precision: 10, scale: 6 }

      t.timestamps
    end
  end
end
