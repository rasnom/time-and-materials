class Employee < ApplicationRecord
	validates :full_name, presence: true

	has_many :timesheets
end
