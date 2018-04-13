require 'rails_helper'

RSpec.describe PayPeriod, type: :model do
	describe 'Creation' do
		it 'is valid with valid inputs' do
			expect(FactoryBot.create(:pay_period).valid?).to be true
		end

		it 'is not valid without an end date' do
			dateless = FactoryBot.build(:pay_period, end_date: nil)
			expect(dateless.valid?).to be false
		end
	end

	describe 'Associations' do
		it { should have_many(:timesheets) }
	end
end
