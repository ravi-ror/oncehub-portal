class CreateRetros < ActiveRecord::Migration[5.2]
  def change
    create_table :retros do |t|
      t.integer :room_id
      t.timestamps
    end
  end
end
