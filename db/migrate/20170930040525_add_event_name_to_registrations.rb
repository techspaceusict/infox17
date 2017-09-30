class AddEventNameToRegistrations < ActiveRecord::Migration[5.0]
  def change
    add_column :registrations, :Event_name, :string
  end
end
