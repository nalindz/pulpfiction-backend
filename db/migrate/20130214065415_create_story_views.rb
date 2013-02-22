class CreateStoryViews < ActiveRecord::Migration
  def change
    create_table :story_views do |t| 
      t.references :story
      t.references :user
      t.timestamps
    end

    add_column :stories, :views_count, :integer, :default => 0
  end

end
