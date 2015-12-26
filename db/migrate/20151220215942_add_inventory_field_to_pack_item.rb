class AddInventoryFieldToPackItem < ActiveRecord::Migration
  def change
    add_column :pack_items, :inventory, :integer,     default: 0, null: false
  end
end
