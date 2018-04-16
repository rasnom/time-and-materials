class CreateWorkEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :work_entries do |t|
    	t.references :timesheet
    	t.datetime :start_time
    	t.datetime :end_time

      t.timestamps
    end
  end
end
