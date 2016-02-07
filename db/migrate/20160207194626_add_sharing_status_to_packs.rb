class AddSharingStatusToPacks < ActiveRecord::Migration
  def change
    add_column :packs, :sharing_status, :integer, default: 2, null: false
  end
end
