class AddUserReferenceToRetro < ActiveRecord::Migration[5.2]
  def change
    add_reference :retros, :user, foreign_key: true
  end
end
