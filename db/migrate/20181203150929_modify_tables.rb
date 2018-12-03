class ModifyTables < ActiveRecord::Migration[5.2]
  def change

    add_column :stories, :active, :boolean

    rename_column :comments, :audio_clip, :text

  end
end
