class EditTables < ActiveRecord::Migration[5.2]


  def change
    create_table :countries do |t|
      t.string :name
      t.string :key
      t.string :stories

      t.timestamps
  end
  add_column :stories, :country_id, :integer

  remove_column :stories, :content
end

end
