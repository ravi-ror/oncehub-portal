class AddSprintNameToRetro < ActiveRecord::Migration[5.2]
  def change
    add_column :retros, :sprint_name, :string
  end
end
