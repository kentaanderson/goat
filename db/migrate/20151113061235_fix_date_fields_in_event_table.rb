class FixDateFieldsInEventTable < ActiveRecord::Migration
  def change
    remove_column :events, :start_date
    remove_column :events, :return_date

    add_column :events, :start_date, :date
    add_column :events, :return_date, :date

  end
end
