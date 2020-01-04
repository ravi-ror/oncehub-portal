class CreatePointingPokers < ActiveRecord::Migration[5.2]
  def change
    create_table :pointing_pokers do |t|
      t.string :title
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
