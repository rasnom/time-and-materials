class PayPeriod < ApplicationRecord
	validates :end_date, presence: true

	has_many :timesheets
end
