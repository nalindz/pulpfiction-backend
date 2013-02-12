class RemoveHistoriesAddBookmarks < ActiveRecord::Migration
  def change
    drop_table :histories

    create_table :bookmarks do |t|
      t.references :user
      t.references :story
      t.integer :page_number
      t.integer :font_size

      t.timestamps
    end
  end
end
