class CreatePackItems < ActiveRecord::Migration
  def change
    create_table :pack_items do |t|

      t.timestamps null: false
    end
  end
end
