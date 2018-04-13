require 'rails_helper'

RSpec.describe Employee, type: :model do
	describe 'Creation' do
		it 'is valid with valid inputs' do
			expect(FactoryBot.create(:employee).valid?).to be true
		end

		it 'is not valid without a full_name' do
			new_employee = FactoryBot.build(:employee, full_name: nil)
			expect(new_employee.valid?).to be false
		end
	end

	describe 'Assocations' do
		it { should have_many(:timesheets) }
	end
end
