class AddShortDToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :sd, :string
  end
end
