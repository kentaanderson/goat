class AddManufacturerToPackItems < ActiveRecord::Migration
  def change
    add_column :pack_items, :manufacturer, :string
  end
end
