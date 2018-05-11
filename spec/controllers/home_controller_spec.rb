require 'rails_helper'

RSpec.describe HomeController, type: :controller do

	describe 'show' do
		let!(:pay_period_list) { FactoryBot.create_list(:pay_period, 4) }
		before(:each) { get :show }

		it 'renders the show template' do
			expect(response).to render_template('show')
		end

		it 'assigns @pay_periods' do
			expect(assigns(:pay_periods)).to eq pay_period_list
		end
	end

end
