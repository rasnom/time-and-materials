require 'rails_helper'

RSpec.describe Project, type: :model do
	describe 'creation' do
		it 'is not valid without a name' do
			new_project = FactoryBot.build(:project, name: nil)
			expect(new_project.valid?).to be false
		end

		it 'is valid with all the necessary params' do
			expect(FactoryBot.create(:project).valid?).to be true
		end
	end

	describe 'associations' do
		it { should have_many(:work_entries) }
	end
end
