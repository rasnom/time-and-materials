require 'rails_helper'

RSpec.describe TimesheetsController, type: :controller do

	describe 'GET index' do
		it 'renders the timesheets index' do
			get :index
			expect(response).to render_template('index')
		end

		it 'assigns @timesheets' do
			timesheet_list = FactoryBot.create_list(:timesheet, 6)
			get :index
			expect(assigns(:timesheets)).to eq timesheet_list
		end
	end

end
