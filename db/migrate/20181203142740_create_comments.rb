class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :audio_clip
      t.integer :story_id

      t.timestamps
    end
  end
end
