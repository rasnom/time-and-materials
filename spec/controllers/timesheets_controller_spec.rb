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

	describe 'GET show' do
		let!(:timesheet) { FactoryBot.create(:timesheet) }
		before(:each) { get :show, params: { id: timesheet.id } }
	
		it 'renders the timesheets show view' do
			expect(response).to render_template('show')
		end

		it 'assigns @timesheet' do
			expect(assigns(:timesheet)).to eq timesheet
		end
	end

	describe 'GET edit' do
		let!(:timesheet) { FactoryBot.create(:timesheet) }
		before(:each) { get :edit, params: { id: timesheet.id} }

		it 'renders the timesheets edit view' do
			expect(response).to render_template('edit')
		end

		it 'assigns @timesheet' do
			expect(assigns(:timesheet)).to eq timesheet
		end
	end

end
