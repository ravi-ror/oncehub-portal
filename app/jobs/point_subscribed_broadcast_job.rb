class PointSubscribedBroadcastJob < ApplicationJob
  queue_as :default

  def perform(user, room_id)
    ActionCable.server.broadcast "pointing_poker_rooms_#{room_id}_channel",
                                 message: {action: 'user_connected', user: user}
  end
end