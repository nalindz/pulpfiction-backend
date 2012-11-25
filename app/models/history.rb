class History < ActiveRecord::Base
  attr_accessible :story, :user, :story_id
  belongs_to :story
  belongs_to :user
end
