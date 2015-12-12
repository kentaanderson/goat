class AddMoreFieldsToPackItems < ActiveRecord::Migration
  def change
 	remove_column :pack_items, :wearing
 	remove_column :pack_items, :delivery
 	remove_column :pack_items, :pack_id

    add_column :pack_items, :event_id, :integer
    add_column :pack_items, :icon, :string
    add_column :pack_items, :user_id, :integer
    add_column :pack_items, :gear_id, :integer
    add_column :pack_items, :wearing, :integer,     default: 0, null: false
    add_column :pack_items, :delivery, :integer,     default: 0, null: false

  end
end
