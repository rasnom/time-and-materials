require 'rails_helper'

RSpec.describe 'PayPeriods', type: :feature, js: true do
	let!(:employees) { FactoryBot.create_list(:employee, 3) }
	let!(:recent_periods) do
		[
			FactoryBot.create(:pay_period, end_date: "2018-05-15"),
			FactoryBot.create(:pay_period, end_date: "2018-01-01"),
			FactoryBot.create(:pay_period, end_date: "2018-03-22")
		]
	end

	describe 'Index' do
		describe 'PayPeriod list' do
			before(:each) { visit '/pay_periods' }

			it 'displays a list of the pay periods' do
				expect(page).to have_content (recent_periods[0].end_date.to_s)
				expect(page).to have_content (recent_periods[1].end_date.to_s)
			end

			it 'links to the individual show pages for the periods' do 
				some_period = recent_periods.last
				click_link(some_period.end_date.to_s)
				expect(page).to have_current_path(pay_periods_path(some_period))
			end
		end
	end

	describe 'Show' do
		before(:each) { visit "/pay_periods/#{period.id}" }
		
		describe 'Timesheet list' do
			let!(:period) { recent_periods[2] }
			
			xit 'lists the timesheets for the period' do
				period.timesheets.each do |timesheet|
					expect(page).to have_css ("#timesheet-#{timesheet.id}")
				end
			end

		end
	end

end