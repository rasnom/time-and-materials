class TimesheetsController < ApplicationController

	def index
		@timesheets = Timesheet.all
	end

end
