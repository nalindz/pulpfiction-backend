class Story < ActiveRecord::Base
  attr_accessible :user, :title
  belongs_to :user
  has_many :blocks
end
