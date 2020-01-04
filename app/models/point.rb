class Point < ApplicationRecord
  belongs_to :user
  belongs_to :pointing_poker


  after_create_commit { PointBroadcastJob.perform_later(self) }
  after_create_commit { update_pointing_poker_channel }


  private


  def update_pointing_poker_channel
    channel_user = PointingPokerChannel.find_by(
      user_id: self.user_id,
      pointing_poker_id: self.pointing_poker_id
    )

    channel_user.update!(points: self.point)
  end

end
