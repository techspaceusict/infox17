class AddEmailToRegistrations < ActiveRecord::Migration[5.0]
  def change
    add_column :registrations, :email, :string
  end
end
