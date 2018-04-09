require 'rails_helper'

RSpec.describe "Home", type: :request do
	describe "Visit the home page" do 
		it 'home is visited', js: true do 
			visit '/'
			expect(page).to have_content "Time and Materials"
		end
	end
end