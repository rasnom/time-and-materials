require 'rails_helper'

RSpec.describe "Timesheets", type: :feature, js: true do
	describe "index" do 
		let!(:timesheet_list) { FactoryBot.create_list(:timesheet, 5) }
		before(:each) { visit '/timesheets' }

		it 'exists' do
			expect(page).to have_content "Timesheets"
		end

		it 'lists all the timesheets' do
			expect(page).to have_content timesheet_list.first.employee.full_name
			expect(page).to have_content timesheet_list.last.employee.full_name
		end
	end
end
