class AddWeightToPackItems < ActiveRecord::Migration
  def change
    add_column :pack_items, :weight_oz, :decimal
    add_column :pack_items, :weight_grams, :integer
  end
end
