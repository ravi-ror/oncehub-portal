class RetroResponse < ApplicationRecord
  belongs_to :user
  belongs_to :retro


  def save_user_response(user, retro_id)

  end
end
