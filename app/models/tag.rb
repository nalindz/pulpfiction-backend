class Tag < ActiveRecord::Base
  attr_accessible :text, :story_id, :story
  belongs_to :story
end
