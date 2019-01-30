class AddTwoColumns < ActiveRecord::Migration[5.2]
  def change
    add_column :meetup_locations, :host, :bigint
    add_column :meetup_locations, :guest, :bigint
  end
end
