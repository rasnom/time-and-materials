FactoryBot.define do
  factory :pay_period do
 		end_date "2018-01-14"   
  end
 
  factory :employee do
  	full_name "Little John"	  
  end

	factory(:timesheet) do
		employee_id 12
		pay_period_id 7

		employee
	end
end