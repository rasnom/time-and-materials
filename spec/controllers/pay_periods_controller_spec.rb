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

end
