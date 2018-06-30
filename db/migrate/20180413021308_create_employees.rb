class CreateEmployees < ActiveRecord::Migration[5.1]
  def change
    create_table :employees do |t|
    	t.string :full_name, null: false
    	t.string :nickname
    	
      t.timestamps
    end
  end
end
