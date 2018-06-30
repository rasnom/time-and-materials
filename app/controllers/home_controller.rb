class HomeController < ApplicationController

	def show
		@pay_periods = PayPeriod.all
	end

end
