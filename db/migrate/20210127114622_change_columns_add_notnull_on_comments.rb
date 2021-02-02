class ChangeColumnsAddNotnullOnComments < ActiveRecord::Migration[5.2]
  def change
    change_column_null :comments, :name, false
    change_column_null :comments, :comment, false
  end
end
