class PayPeriodsController < ApplicationController

	def index
		@pay_periods = PayPeriod.all
	end

end
