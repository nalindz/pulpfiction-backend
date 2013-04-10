class AddStoryIdIndexToBookmarks < ActiveRecord::Migration
  def change
    add_index :bookmarks, :story_id
  end
end
