class Team < ApplicationRecord
	validates :name, presence: true
	has_many :users, dependent: :nullify
end
