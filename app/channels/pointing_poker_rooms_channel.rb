class PointingPokerRoomsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "pointing_poker_rooms_#{params['room_id']}_channel"

    # Sending event user connected
    channel_user = PointingPokerChannel.find_by(user_id: current_user.id, pointing_poker_id: params['room_id'])
    PointingPokerChannel.create!(user_id: current_user.id, pointing_poker_id: params['room_id']) unless channel_user.present?
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def send_message(data)
    current_user.points.create!(point: data['message'], pointing_poker_id: data['room_id'])
  end
end