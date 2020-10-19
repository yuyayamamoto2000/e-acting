class CreateWorks < ActiveRecord::Migration[5.2]
  def change
    create_table :works do |t|
      t.integer :method, null: false
      t.string :gametitle, null: false
      t.date :deadline, null: false
      t.integer :reward, null: false
      t.integer :payment, null: false
      t.string :comment
      t.timestamps
    end
  end
end
