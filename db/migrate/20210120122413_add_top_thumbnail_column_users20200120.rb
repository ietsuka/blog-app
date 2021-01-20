class AddTopThumbnailColumnUsers20200120 < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :blog_thumbnail, :string
  end
end
