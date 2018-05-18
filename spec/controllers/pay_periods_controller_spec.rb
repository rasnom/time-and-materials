require 'rails_helper'

RSpec.describe PayPeriodsController, type: :controller do
	let!(:pay_period_list) { FactoryBot.create_list(:pay_period, 5) }

	describe 'GET index' do
		before(:each) { get :index }

		it 'renders the pay periods index' do
			expect(page).to render_template('index')
		end

		it 'assigns @pay_periods' do
			expect(assigns(:pay_periods)).to eq pay_period_list
		end
	end

	describe 'GET show' do 
		let!(:period) { pay_period_list[1] }
		before(:each) { visit "/pay_periods/#{period.id}" }

		before(:each) { get :show, params: { id: period.id } }

		it 'renders the pay periods show view' do
			expect(page).to render_template('show')
		end

		it 'assigns @period' do
			expect(assigns(:period)).to eq period
		end

		it 'assigns @timesheets' do 
			expect(assigns(:timesheets)).to eq period.timesheets
		end
	end

end
