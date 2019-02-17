class AddHostColumn < ActiveRecord::Migration[5.2]
  def change
    add_column :meetup_locations, :host_id, :integer
  end
end
