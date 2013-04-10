class CreateUserStats < ActiveRecord::Migration
  def change
    create_table :user_stats do |t| 
      t.references :user
      t.integer :own_stories_views, :default => 0
      t.integer :own_stories_bookmarks, :default => 0
      t.integer :total_stories_views, :default => 0
      t.integer :total_stories_bookmarks, :default => 0

      t.timestamps
    end

    User.all.each do |user|
      UserStat.create! user: user
    end
  end
end
