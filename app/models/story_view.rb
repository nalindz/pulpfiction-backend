class StoryView < ActiveRecord::Base
  attr_accessible :story_id, :user_id
  belongs_to :user
  belongs_to :story, :counter_cache => :views_count
  after_create :update_user_stat

  def update_user_stat
    self.user.stat.increment!(:total_stories_views)
    self.story.user.stat.increment!(:own_stories_views)
  end
end
