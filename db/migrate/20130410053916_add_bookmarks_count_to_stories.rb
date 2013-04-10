class AddBookmarksCountToStories < ActiveRecord::Migration
  def change
    add_column :stories, :bookmarks_count, :integer, :default => 0
  end
end
