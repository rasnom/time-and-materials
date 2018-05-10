require 'rails_helper'

RSpec.describe 'PayPeriods', type: :feature, js: true do

	describe 'Index' do
		let!(:recent_periods) do
			recent_periods = [
				FactoryBot.build(:pay_period, end_date: "2018-05-15"),
				FactoryBot.build(:pay_period, end_date: "2018-01-01"),
				FactoryBot.build(:pay_period, end_date: "2018-03-22")
			]
		end

		xit 'displays a list of the pay periods' do
			visit '/pay_periods'
			expect(page).to have_content (recent_periods[0].end_date.to_s)
			expect(page).to have_content (recent_periods[1].end_date.to_s)
		end
	end

end