require 'rails_helper'

RSpec.describe WorkEntry, type: :model do
	describe 'creation' do
		it 'is not valid without a timesheet' do
			timesheetless = FactoryBot.build(:work_entry, timesheet_id: nil)
			expect(timesheetless.valid?).to be false
		end

		it 'is not valid without a start datetime' do
			startless = FactoryBot.build(:work_entry, start_time: nil)
			expect(startless.valid?).to be false
		end

		it 'is not valid without an end datetime' do
			endless = FactoryBot.build(:work_entry, end_time: nil)
			expect(endless.valid?).to be false
		end

		it 'is valid with valid inputs' do
			expect(FactoryBot.create(:work_entry).valid?).to be true
		end
	end

	describe 'associations' do
		it { should belong_to(:timesheet) }
	end
end
