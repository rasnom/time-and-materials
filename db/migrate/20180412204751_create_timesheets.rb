class CreateTimesheets < ActiveRecord::Migration[5.1]
  def change
    create_table :timesheets do |t|
    	t.references :pay_period, null: false
    	t.references :employee, null: false
    	t.float :total_hours, null: false, default: 0
    	
    	t.timestamps
    end
  end
end
