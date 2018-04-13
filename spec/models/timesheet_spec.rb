require 'rails_helper'

RSpec.describe Timesheet, type: :model do
  
	describe 'Creation' do
		it 'is valid with a P_period and employee' do
			new_sheet = FactoryBot.create(:timesheet)
			expect(new_sheet.valid?).to be true
		end

		it 'starts with an initial default total_hours of zero' do
			expect(Timesheet.new.total_hours).to eq 0
		end

		it 'is not valid without total_hours' do
			new_sheet = FactoryBot.create(:timesheet)
			new_sheet.total_hours = nil
			expect(new_sheet.valid?).to be false
		end

		it 'is not valid without a pay_period' do
			new_sheet = FactoryBot.build(:timesheet, pay_period_id: nil)
			expect(new_sheet.valid?).to be false
		end

		it 'is not valid without an employee' do
			new_sheet = FactoryBot.build(:timesheet, employee_id: nil)
			expect(new_sheet.valid?).to be false
		end
	end

	describe 'Associations' do
		it { should belong_to(:employee) }
		it { should belong_to(:pay_period) }
	end

end
