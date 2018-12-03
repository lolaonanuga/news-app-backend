class CreateStories < ActiveRecord::Migration[5.2]
  def change
    create_table :stories do |t|
      t.string :title
      t.string :description
      t.string :url
      t.string :publishedAt
      t.string :comments

      t.timestamps
    end
  end
end
