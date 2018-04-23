require 'rails_helper'

RSpec.describe 'Timesheets', type: :feature, js: true do
	describe 'index' do 
		let!(:timesheet_list) { FactoryBot.create_list(:timesheet, 5) }
		before(:each) { visit '/timesheets' }

		it 'exists' do
			expect(page).to have_content 'Timesheets'
		end

		it 'lists all the timesheets' do
			expect(page).to have_content timesheet_list.first.employee.full_name
			expect(page).to have_content timesheet_list.last.employee.full_name
		end

		it 'links to the individual timesheets' do
			some_timesheet = timesheet_list[2]
			page.find("div#timesheet-#{some_timesheet.id} a").click
	 		expect(current_path).to eq(timesheet_path(some_timesheet))
		end
	end

	describe 'show' do
		let!(:timesheet) { FactoryBot.create(:timesheet_with_entries) }
		before(:each) { visit "/timesheets/#{timesheet.id}" }

		it 'displays the details of the timesheet' do
			expect(page).to have_content 'Timesheet Details'
			expect(page).to have_content timesheet.total_hours.to_s
		end

		it 'displays some details of the models associated to the timesheet' do
			expect(page).to have_content timesheet.employee.full_name
			expect(page).to have_content timesheet.pay_period.end_date
		end

		it 'displays the work entries that belong to the timesheet' do
			some_work_entry = timesheet.work_entries.first
			details = page.find("div#work_entry-#{some_work_entry.id}").text

			expect(details).to include some_work_entry.project.name
			expect(details).to include some_work_entry.start_time.to_s
			expect(details).to include some_work_entry.end_time.to_s
			expect(page.all("div.work_entry").count).to eq timesheet.work_entries.length
		end
	end

	describe 'edit' do
		let!(:timesheet) { FactoryBot.create(:timesheet) }
		before(:each) { visit "/timesheets/#{timesheet.id}/edit" }

		it 'displays the immutable timesheet details' do
			expect(page).to have_content timesheet.employee.full_name
			expect(page).to have_content timesheet.pay_period.end_date
		end

		xit 'prepopulates the timesheet form fields with existing data' do
			expect(page.find('input[name="employee"]').text).to eq timesheet.employee.full_name
			expect(page.find('input[name="pay_period"]').text).to eq timesheet.pay_period.end_date.to_s
		end

		describe 'form with work entries' do
			let!(:full_timesheet) { FactoryBot.create(:timesheet_with_entries) }

			xit 'includes the related work entry fields in the form' do
				expect(page).to have_css 'div.work_entry input[name="project"]'
				expect(page).to have_css 'div.work_entry input[name="start_time"]'	
				expect(page).to have_css 'div.work_entry input[name="end_time"]'
			end
		end
	end
end
