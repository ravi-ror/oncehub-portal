class AddPointsToPointingPokerChannel < ActiveRecord::Migration[5.2]
  def change
    add_column :pointing_poker_channels, :points, :integer
  end
end
