class Project < ApplicationRecord
	validates :name, presence: true

	has_many :work_entries
end
