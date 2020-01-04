class PointBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast "pointing_poker_rooms_#{message.pointing_poker.id}_channel",
                                 message: message
  end
end