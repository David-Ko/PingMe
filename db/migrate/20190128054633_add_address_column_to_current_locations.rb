class AddAddressColumnToCurrentLocations < ActiveRecord::Migration[5.2]
  def change
    add_column :current_locations, :address, :string
  end
end
