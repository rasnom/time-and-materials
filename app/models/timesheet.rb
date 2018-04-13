class Timesheet < ApplicationRecord
	validates :employee_id, presence: true
	validates :pay_period_id, presence: true

end
