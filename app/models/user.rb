class User < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :facebook_id, :email, :username
  has_many :stories
  has_many :bookmarks
end
