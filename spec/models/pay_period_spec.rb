require 'rails_helper'

RSpec.describe PayPeriod, type: :model do
	describe 'Creation' do
		before(:each) { FactoryBot.create(:employee) }

		it 'is valid with valid inputs' do
			expect(FactoryBot.create(:pay_period).valid?).to be true
		end

		it 'is not valid without an end date' do
			dateless = FactoryBot.build(:pay_period, end_date: nil)
			expect(dateless.valid?).to be false
		end

		describe 'Creating the associated timesheets' do
			before(:each) { FactoryBot.create_list(:employee, 7) }
			let(:new_period) { FactoryBot.create(:pay_period) }

			it 'should create an associated timesheet for each employee for the new period' do
				expect(new_period.timesheets.pluck(:employee_id)).to eq Employee.pluck(:id)
			end
		end

		it 'requires there to be at least one employee' do
			Employee.delete_all
			expect(FactoryBot.build(:pay_period).valid?).to be false
		end

	end

	describe 'Associations' do
		it { should have_many(:timesheets) }
		it { should have_many(:employees) } # (through timesheets)
	end
end
