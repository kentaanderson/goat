class AddPackIdToPackItemsAgain < ActiveRecord::Migration
  def change
    add_column :pack_items, :pack_id, :integer
  end
end
