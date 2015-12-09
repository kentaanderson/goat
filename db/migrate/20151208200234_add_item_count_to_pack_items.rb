	class AddItemCountToPackItems < ActiveRecord::Migration
  def change
    add_column :pack_items, :item_count, :integer
  end
end
