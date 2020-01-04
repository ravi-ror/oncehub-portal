class CreatePoints < ActiveRecord::Migration[5.2]
  def change
    create_table :points do |t|
      t.integer :point
      t.references :user, foreign_key: true
      t.references :pointing_pokers, foreign_key: true

      t.timestamps
    end
  end
end
