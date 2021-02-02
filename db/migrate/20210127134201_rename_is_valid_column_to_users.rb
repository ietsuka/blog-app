class RenameIsValidColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :is_valid, :is_active
  end
end
