class AddTargetWeightToPack < ActiveRecord::Migration
  def change
    add_column :packs, :target_weight, :decimal
  end
end
