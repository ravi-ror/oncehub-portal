class TeamsController < ApplicationController
  before_action :authenticate_user!

  def index
    @teams = Team.all
  end

  def show
    @team = Team.friendly.find(params[:id])
    @users = @team.members.with_role(:developer).to_a
    @sm = @team.members.with_role(:sm).first
    #@users.unshift(@team)
  end
end
  