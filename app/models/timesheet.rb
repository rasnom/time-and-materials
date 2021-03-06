class Timesheet < ApplicationRecord
	validates :employee_id, presence: true
	validates :pay_period_id, presence: true
	validates :total_hours, numericality: true

	belongs_to :employee
	belongs_to :pay_period
	has_many :work_entries

	accepts_nested_attributes_for :work_entries
end
