class UserStat < ActiveRecord::Base
  attr_accessible :own_stories_views, :own_stories_bookmarks, :total_stories_views, :total_stories_bookmarks, :user
  belongs_to :user
end
