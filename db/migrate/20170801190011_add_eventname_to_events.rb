class AddEventnameToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :event_name, :string
    add_column :events, :string, :string
  end
end
