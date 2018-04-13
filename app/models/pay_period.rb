class PayPeriod < ApplicationRecord
	validates :end_date, presence: true
end
