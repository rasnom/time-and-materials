FactoryBot.define do
  factory :employee do
  	full_name "Little John"	  
  end

	factory(:timesheet) do
		employee_id 12
		pay_period_id 7

		employee
	end
end