class RefreshCategories < ActiveRecord::Migration
  def change
  	drop_table :categories
    create_table :categories do |t|
      t.string :category_name
      t.timestamps null: false
    end
  end
end
