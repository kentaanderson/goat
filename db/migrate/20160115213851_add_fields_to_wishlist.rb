class AddFieldsToWishlist < ActiveRecord::Migration
  def change
    add_column :wishlists, :name, :string
    add_column :wishlists, :description, :string
    add_column :wishlists, :weight_oz, :decimal
    add_column :wishlists, :weight_grams, :integer
    add_column :wishlists, :icon, :string
    add_column :wishlists, :category_id, :integer
    add_column :wishlists, :manufacturer, :string
    add_column :wishlists, :user_id, :integer
    add_column :wishlists, :link, :string
  end
end
