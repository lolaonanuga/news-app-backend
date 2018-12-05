class AddSentimenttoStories < ActiveRecord::Migration[5.2]
  def change
    add_column :stories, :sentiment, :float
  end
end
