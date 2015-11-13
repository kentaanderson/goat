class RebuildEventsTable < ActiveRecord::Migration
  def change
  	drop_table :events 
    create_table :events do |t|
      t.string :title
      t.datetime :start_date
      t.datetime :return_date
      t.string :map_url
      t.string :description
      t.string :comments
      t.string :summary
      t.integer :event_type_id
      t.string :event_type_other
      t.integer :sharing_status
      t.integer :user_id
      t.timestamps null: false 
    end
  end
end
