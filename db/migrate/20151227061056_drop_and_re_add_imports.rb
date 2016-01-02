class DropAndReAddImports < ActiveRecord::Migration
  def change
  	drop_table :imports
    create_table :imports do |t|
      t.string :name
      t.integer :user_id
      t.integer :event_id
      t.integer :gear_id
      t.timestamps null: false
    end
  end
end
