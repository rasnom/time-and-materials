class TimesheetsController < ApplicationController

	def index
		@timesheets = Timesheet.all
	end

	def show
		@timesheet = Timesheet.find(params[:id])
	end

	def edit
		@timesheet = Timesheet.find(params[:id])
	end

	def update
		p params
		timesheet = Timesheet.find(params[:id])
		timesheet.update(employee_id: timesheet_params[:employee_id])
	end

	private

		def timesheet_params
			params.permit(:employee_id)
		end

end
