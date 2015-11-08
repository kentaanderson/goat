class CreateGears < ActiveRecord::Migration
  def change
    create_table :gears do |t|
      t.string :name
      t.string :description
      t.integer :year_acquired
      t.decimal :weight_oz
      t.decimal :weight_grams

      t.timestamps null: false
    end
  end
end
