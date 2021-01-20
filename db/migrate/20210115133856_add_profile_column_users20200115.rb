class AddProfileColumnUsers20200115 < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :profile, :string
    add_column :users, :birthday, :date
    add_column :users, :profile_thumbnail, :string
  end
end
