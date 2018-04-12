require 'rails_helper'

RSpec.describe Timesheet, type: :model do
  
	it 'is valid with valid attribues' do
		expect(Timesheet.new).to be_valid
	end

end
