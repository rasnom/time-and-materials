class TimesheetsController < ApplicationController

	def index
		@timesheets = Timesheet.all
	end

	def show
		@timesheet = Timesheet.find(params[:id])
	end

end
