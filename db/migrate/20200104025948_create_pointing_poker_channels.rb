class CreatePointingPokerChannels < ActiveRecord::Migration[5.2]
  def change
    create_table :pointing_poker_channels do |t|
      t.integer :user_id
      t.references :pointing_poker, foreign_key: true

      t.timestamps
    end
  end
end
