class RetroRoomsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "retro_rooms_#{params['retro_room_id']}_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def send_message(data)
    retro = RetroResponse.where(user_id: current_user.id, retro_id: data['retro_room_id']).first_or_initialize
    retro.good = data['good']
    retro.bad = data['bad']

    retro.save!
    # Broadcasting
    RetroBroadcastJob.perform_later({
      retro: retro,
      user: retro.user
    })
  end
end