require 'rails_helper'

RSpec.describe "Timesheets", type: :feature, js: true do
	describe "index" do 
		it 'exists' do
			visit '/timesheets'
			expect(page).to have_content "Timesheets"
		end
	end
end
