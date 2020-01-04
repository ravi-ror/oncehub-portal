class PointingPoker < ApplicationRecord
  has_many :points, dependent: :destroy
  has_many :pointing_poker_channels, dependent: :destroy
end
