class AddColumnWorks < ActiveRecord::Migration[5.2]
  def change
    add_column :works, :model, :integer, null: false
    add_column :works, :work, :string, null: false
  end
end
