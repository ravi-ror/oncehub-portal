class UserController < ApplicationController
  before_action :authenticate_user!

  def profile
    @current_user = current_user
  end
end
