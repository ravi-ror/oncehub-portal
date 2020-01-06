class CreateExpenses < ActiveRecord::Migration[5.2]
  def change
    create_table :expenses do |t|
      t.float :amount
      t.integer :month
      t.integer :year
      t.integer :status
      t.text :description
      t.references :user
      t.timestamps
    end
  end
end
