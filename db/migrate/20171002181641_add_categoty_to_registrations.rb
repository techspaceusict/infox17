class AddCategotyToRegistrations < ActiveRecord::Migration[5.0]
  def change
    add_column :registrations, :category, :string
  end
end
