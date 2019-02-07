class CreateCurrentLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :current_locations do |t|
      t.float :current_latitude
      t.float :current_longitude

      t.timestamps
    end
  end
end
