class AddColumnWorks < ActiveRecord::Migration[5.2]
  def change
    add_column :works, :gamemodel, :integer, null: false
    add_column :works, :work, :string, null: false
  end
end
