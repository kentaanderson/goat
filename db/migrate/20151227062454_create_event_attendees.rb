class CreateEventAttendees < ActiveRecord::Migration
  def change
    create_table :event_attendees do |t|
      t.integer :event_id, null: false
      t.integer :user_id, null: false
      t.timestamps null: false
    end
  end
end
