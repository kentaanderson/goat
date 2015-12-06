class DropTableJobs < ActiveRecord::Migration
  def change
  	  	drop_table :jobs
  end
end