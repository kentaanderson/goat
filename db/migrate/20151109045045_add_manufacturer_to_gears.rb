class AddManufacturerToGears < ActiveRecord::Migration
  def change
    add_column :gears, :manufacturer, :string
  end
end
