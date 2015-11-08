class AddIconToGears < ActiveRecord::Migration
  def change
    add_column :gears, :icon, :string
  end
end
