class ChangeYearAcquiredToString < ActiveRecord::Migration
  def change
  	remove_column :pack_items, :year_acquired
	remove_column :gears, :year_acquired
	remove_column :imports, :year_acquired
	remove_column :imports, :description
	remove_column :imports, :weight_oz
	remove_column :imports, :weight_grams
	remove_column :imports, :icon
	remove_column :imports, :category_id
	remove_column :imports, :manufacturer

  	 add_column :pack_items, :year_acquired, :string
  	 add_column :gears, :year_acquired, :string
  end
end
