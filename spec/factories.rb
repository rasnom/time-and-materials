FactoryBot.define do
  factory :work_entry do
  	timesheet_id 5555
  	start_time 'May 3, 1999'
  	end_time 'May 1, 1977'

  	timesheet  
  end

  factory :pay_period do
 		end_date '2018-01-14'   
  end
 
  factory :employee do
  	full_name 'Little John'	  
  end

	factory(:timesheet) do
		employee_id 12
		pay_period_id 7

		employee
		pay_period
	end
end