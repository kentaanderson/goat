class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :startdate
      t.datetime :returndate
      t.string :map_url
      t.string :comments
      t.string :summary
      t.integer :event_type_id
      t.string :event_type_other
      t.integer :sharing_status

      t.timestamps null: false
    end
  end
end
