class AddSharingStatusToPackItems < ActiveRecord::Migration
  def change
    add_column :pack_items, :sharing_status, :integer, default: 2, null: false
  end
end
