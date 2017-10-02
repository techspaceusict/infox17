class AddCategoryToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :category, :string
  end
end
