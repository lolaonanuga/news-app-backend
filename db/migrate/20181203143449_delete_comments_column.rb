class DeleteCommentsColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :stories, :comments
  end
end
