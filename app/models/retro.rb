class Retro < ApplicationRecord
  belongs_to :user

  has_many :retro_responses
end
