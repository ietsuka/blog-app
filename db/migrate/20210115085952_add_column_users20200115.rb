class AddColumnUsers20200115 < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :blog_name, :string
  end
end
