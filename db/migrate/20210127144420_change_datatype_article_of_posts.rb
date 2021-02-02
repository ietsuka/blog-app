class ChangeDatatypeArticleOfPosts < ActiveRecord::Migration[5.2]
  def change
    change_column :posts, :article, :text
  end
end
