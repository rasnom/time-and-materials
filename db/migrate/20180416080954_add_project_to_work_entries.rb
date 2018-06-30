class AddProjectToWorkEntries < ActiveRecord::Migration[5.1]
  def change
  	add_reference :work_entries, :project 
  end
end
