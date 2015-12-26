class AddGearIdToImports < ActiveRecord::Migration
  def change
  	 add_column :imports, :gear_id, :integer
  end
end
