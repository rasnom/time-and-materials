class PayPeriod < ApplicationRecord
	validates :end_date, presence: true

	has_many :timesheets
	has_many :employees, through: :timesheets	

	after_create :create_timesheets

	private

	def create_timesheets
		Employee.all.each do |employee|
			self.timesheets.create(employee_id: employee.id)
		end
	end
end
