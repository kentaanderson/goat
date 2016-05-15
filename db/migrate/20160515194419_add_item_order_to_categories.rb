class AddItemOrderToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :item_order, :integer
  end
end
