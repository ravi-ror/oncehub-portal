class CreateInspirationalQuotes < ActiveRecord::Migration[5.2]
  def change
    create_table :inspirational_quotes do |t|
      t.text :text, null: false
      t.timestamps
    end
  end
end
