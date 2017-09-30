class AddEventidmToRegistrations < ActiveRecord::Migration[5.0]
  def change
    add_column :registrations, :Eventidm, :string
  end
end
