class AddDetailToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :phone, :string
    add_column :users, :college, :string
    add_column :users, :branch, :string
    add_column :users, :year, :string
    add_column :users, :degree, :string
  end
end
