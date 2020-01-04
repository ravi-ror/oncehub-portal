class CreateRetroResponses < ActiveRecord::Migration[5.2]
  def change
    create_table :retro_responses do |t|
      t.string :good
      t.string :bad
      t.references :user, foreign_key: true
      t.references :retro, foreign_key: true

      t.timestamps
    end
  end
end
