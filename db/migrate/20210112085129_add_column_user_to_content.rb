class AddColumnUserToContent < ActiveRecord::Migration[5.2]
  def change
    add_reference :contents, :user, index: true, foreign_key: true
  end
end
