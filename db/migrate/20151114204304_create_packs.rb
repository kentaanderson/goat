class CreatePacks < ActiveRecord::Migration
  def change
    create_table :packs do |t|
      t.integer :user_id # fk_user : ownership
      t.integer :gear_id # fk_gear : pack attributes: weight, manufacturer, year_acquired
      t.integer :event_id # fk_event : when pack is put into action
      t.string :name
      t.string :summary

      t.timestamps null: false
    end
  end
end
