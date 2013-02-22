class StoryView < ActiveRecord::Base
  attr_accessible :story_id, :user_id
  belongs_to :user
  belongs_to :story, :counter_cache => :views_count
end
