class AddFieldsToPackItems < ActiveRecord::Migration
  def change
    add_column :pack_items, :name, :string
    add_column :pack_items, :description, :string
    add_column :pack_items, :post_summary, :string
    add_column :pack_items, :wearing, :integer
    add_column :pack_items, :delivery, :integer
    add_column :pack_items, :category_id, :integer
    add_column :pack_items, :highlight, :string
  end
end
