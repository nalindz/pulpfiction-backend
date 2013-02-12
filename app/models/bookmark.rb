class Bookmark < ActiveRecord::Base
  attr_accessible :story_id, :user_id, :page_number, :font_size
  belongs_to :story
  belongs_to :user
end
