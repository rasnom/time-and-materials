require 'rails_helper'

RSpec.describe TimesheetsController, type: :controller do
	let!(:timesheet_list) { FactoryBot.create_list(:timesheet, 6) }
	let!(:timesheet) { timesheet_list[0] }

	describe 'GET index' do
		it 'renders the timesheets index' do
			get :index
			expect(response).to render_template('index')
		end

		it 'assigns @timesheets' do
			get :index
			expect(assigns(:timesheets)).to eq timesheet_list
		end
	end

	describe 'GET show' do
		before(:each) { get :show, params: { id: timesheet.id } }
	
		it 'renders the timesheets show view' do
			expect(response).to render_template('show')
		end

		it 'assigns @timesheet' do
			expect(assigns(:timesheet)).to eq timesheet
		end
	end

	describe 'GET edit' do
		before(:each) { get :edit, params: { id: timesheet.id } }

		it 'renders the timesheets edit view' do
			expect(response).to render_template('edit')
		end

		it 'assigns @timesheet' do
			expect(assigns(:timesheet)).to eq timesheet
		end
	end

	describe 'PUT update' do
		it 'updates a timesheet with valid params' do
			new_employee = FactoryBot.create(:employee)
			put :update, params: { id: timesheet.id, employee_id: new_employee.id }
			expect(Timesheet.find(timesheet.id).employee_id).to eq new_employee.id 
		end
	end
end
