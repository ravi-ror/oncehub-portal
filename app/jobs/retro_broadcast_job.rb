class RetroBroadcastJob < ApplicationJob
  queue_as :default

  def perform(retro_response)
    ActionCable.server.broadcast "retro_rooms_#{retro_response[:retro].retro.id}_channel",
                                 message: retro_response
  end
end