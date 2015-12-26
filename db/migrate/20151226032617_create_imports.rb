class CreateImports < ActiveRecord::Migration
  def change
    create_table :imports do |t|
	    t.string   :name
	    t.string   :description
	    t.integer  :year_acquired
	    t.decimal  :weight_oz
	    t.decimal  :weight_grams
	    t.string   :icon
	    t.integer  :category_id
	    t.string   :manufacturer
	    t.integer  :user_id
	    t.integer  :event_id
	    t.timestamps null: false
    end
  end
end
