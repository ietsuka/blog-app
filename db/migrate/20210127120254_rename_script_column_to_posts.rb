class RenameScriptColumnToPosts < ActiveRecord::Migration[5.2]
  def change
    rename_column :posts, :script, :article
  end
end
