class PointingPokersController < ApplicationController
  def new
    @poker_room = PointingPoker.new
  end

  def create
    @room = current_user.pointing_pokers.build(poker_params)
    if @room.save
      redirect_to @room
    else
      render 'new'
    end
  end

  def show
    @poker_room = PointingPoker.includes(:points).find_by(id: params[:id])
    @channel_users = []
    @poker_room.pointing_poker_channels.each do |c|
      user = User.find(c.user_id)
      @channel_users << {
        id: user.id,
        email: user.email,
        points: c.points
      }
    end
    @point = Point.new
    @url = request.url
  end

  private

  def poker_params
    params.require(:pointing_poker).permit(:title)
  end
end

