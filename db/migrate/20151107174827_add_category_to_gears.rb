class AddCategoryToGears < ActiveRecord::Migration
  def change
    add_column :gears, :category_id, :integer
  end
end
