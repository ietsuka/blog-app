class AddColumnContentToComment < ActiveRecord::Migration[5.2]
  def change
    add_reference :comments, :content, index: true, foreign_key: true
  end
end
