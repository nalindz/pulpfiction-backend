class Bookmark < ActiveRecord::Base
  attr_accessible :story_id, :user_id, :page_number, :font_size
  belongs_to :story, :counter_cache => true
  belongs_to :user
  after_create :increment_user_stat
  after_destroy :decrement_user_stat

  def increment_user_stat
    self.story.user.stat.own_stories_bookmarks += 1
    self.user.stat.total_stories_bookmarks += 1
  end
  
  def decrement_user_stat
    self.story.user.stat.own_stories_bookmarks -= 1 unless self.stories.user.stat.own_stories_bookmarks <= 0
    self.user.stat.total_stories_bookmarks -= 1 unless self.user.stat.total_stories_bookmarks <= 0
  end
end
