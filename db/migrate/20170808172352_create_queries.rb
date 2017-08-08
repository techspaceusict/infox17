class CreateQueries < ActiveRecord::Migration[5.0]
  def change
    create_table :queries do |t|
      t.string :name
      t.string :emaiing
      t.string :email
      t.string :message

      t.timestamps
    end
  end
end
