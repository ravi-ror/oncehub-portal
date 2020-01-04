class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, except: [:show, :index]

  def show #show any employee profile
    @user = User.friendly.find(params[:id])
    render :profile 
  end

  def profile #shows current user profile
  end

  def index
    @users = User.all
  end

  def edit_profile
  end

  def update
    @user.update(user_params)
    redirect_to :profile
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :about, :hobbies, :country)
  end

  def set_user
    @user = current_user
  end
end
