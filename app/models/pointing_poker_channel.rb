class PointingPokerChannel < ApplicationRecord
  has_many :users
  belongs_to :pointing_poker


  after_create_commit { PointSubscribedBroadcastJob.perform_later(User.find(self.user_id), self.pointing_poker_id) }
end
