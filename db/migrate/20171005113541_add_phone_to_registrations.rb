class AddPhoneToRegistrations < ActiveRecord::Migration[5.0]
  def change
    add_column :registrations, :phone, :string
  end
end
