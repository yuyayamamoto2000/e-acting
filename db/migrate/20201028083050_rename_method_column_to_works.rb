class RenameMethodColumnToWorks < ActiveRecord::Migration[5.2]
  def change
    rename_column :works, :method, :kind
  end
end
