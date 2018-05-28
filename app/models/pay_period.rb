class PayPeriod < ApplicationRecord
	validates :end_date, presence: true
	validate :there_are_employees

	has_many :timesheets
	has_many :employees, through: :timesheets	

	after_create :create_timesheets

	private

		def create_timesheets
			Employee.all.each do |employee|
				self.timesheets.create(employee_id: employee.id)
			end
		end

		def there_are_employees
			if Employee.count < 1
				errors.add(:employees, "must be at least one employee")
			end
		end
end
