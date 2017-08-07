class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :Event_id
      t.string :Name
      t.string :image
      t.string :about
      t.string :facebook_link
      t.string :organizer1_name
      t.string :organizer1_phone
      t.string :organizer2_name
      t.string :organizer2_phone
      t.string :date
      t.string :time
      t.timestamps
    end
  end
end
