class AddYearAcquiredToPackItems < ActiveRecord::Migration
  def change
    add_column :pack_items, :year_acquired, :string
  end
end
