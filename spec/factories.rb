FactoryBot.define do
  factory :project do
  	name "44 Ramble Rd"  
  end

  factory :work_entry do
  	timesheet_id 5555
  	project_id 4
  	start_time 'May 3, 1999'
  	end_time 'May 1, 1977'

  	timesheet  
  	project
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

		factory(:timesheet_with_entries) do
			transient do
				entries_count 5
			end

			after(:create) do |timesheet, evaluator|
				create_list(:work_entry, evaluator.entries_count, timesheet: timesheet)
			end
		end
	end
end