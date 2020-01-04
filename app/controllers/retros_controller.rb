class RetrosController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def new
    @retro = Retro.new
  end

  def create
    @retro = current_user.retros.build(retro_params)
    if @retro.save
      redirect_to @retro
    else
      render 'new'
    end
  end

  def show
    @retro = Retro.includes(:retro_responses).find_by(id: params[:id])
    @retro_response = RetroResponse.new
    @url = request.url
  end

  private

  def retro_params
    params.require(:retro).permit(:sprint_name)
  end
end

