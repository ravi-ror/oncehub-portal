class AddUserProfileFields < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :country, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :about, :text
    add_column :users, :hobbies, :text
  end
end
