class ImageUrlLink < ActiveRecord::Migration[5.2]
  def change
    add_column :stories, :image_url, :string
    change_column :stories, :active, :boolean, :default => true
  end
end
