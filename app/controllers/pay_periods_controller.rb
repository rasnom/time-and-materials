class PayPeriodsController < ApplicationController

	def index
		@pay_periods = PayPeriod.all
	end

	def show
		@period = PayPeriod.find(params[:id])
		@timesheets = @period.timesheets
	end

end
