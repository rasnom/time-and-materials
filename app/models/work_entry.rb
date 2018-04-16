class WorkEntry < ApplicationRecord
	validates :timesheet, presence: true
	validates :start_time, presence: true
	validates :end_time, presence: true
	validates :project, presence: true

	belongs_to :timesheet
	belongs_to :project
end
