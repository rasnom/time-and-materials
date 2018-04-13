require 'rails_helper'

RSpec.describe Timesheet, type: :model do
  
	describe 'creation validations:' do
		it 'is valid with a pay_period and employee' do
			new_sheet = Timesheet.new(pay_period_id: 12, employee_id: 99)
			expect(new_sheet.valid?).to be true
		end

		it 'starts with an initial total_hours of zero' do
			expect(Timesheet.new.total_hours).to eq 0
		end

		it 'is not valid without a pay_period' do
			new_sheet = Timesheet.new(employee_id: 101)
			expect(new_sheet.valid?).to be false
		end

		it 'is not valid without an employee' do
			new_sheet = Timesheet.new(pay_period_id: 4)
			expect(new_sheet.valid?).to be false
		end
	end


end
