require 'rails_helper'

RSpec.describe 'Enter timesheets for a week', type: :feature, js: true do
	before(:each) { FactoryBot.create(:employee) }
	let!(:recent_periods) do
		recent_periods = [
			FactoryBot.create(:pay_period, end_date: "2018-05-15"),
			FactoryBot.create(:pay_period, end_date: "2018-01-01"),
			FactoryBot.create(:pay_period, end_date: "2018-03-22")
		]
	end

	describe 'Navigating to a timesheet' do
		let!(:period) { recent_periods[0] }
		let!(:timesheet) { period.timesheets[1] }

		context 'The home page' do
			before(:each) { visit '/' }

			it 'displays a list of the most recent periods on the home page' do
				expect(page).to have_content (recent_periods[0].end_date.to_s)
				expect(page).to have_content (recent_periods[1].end_date.to_s)
			end

			it 'takes you to the details page of a pay period if you click it' do
				some_period = recent_periods[2]
				click_link(some_period.end_date.to_s)
				expect(page).to have_current_path(pay_periods_path(some_period))
			end
		end

		context 'The PayPeriod show page' do
			before(:each) { visit "/pay_periods/#{period.id}" }

			xit 'lists the timesheets for the period' do
				p period
				p timesheet
				expect(page).to have_css ("#timesheet-#{timesheet.id}")	
			end

			xit 'links to the show pages for the timesheet' do 

			end
		end
	end

	
end