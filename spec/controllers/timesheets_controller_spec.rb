require 'rails_helper'

RSpec.describe TimesheetsController, type: :controller do

	describe 'GET index' do
		it 'renders the timesheets index' do
			get :index
			expect(response).to render_template('index')
		end
	end

end
