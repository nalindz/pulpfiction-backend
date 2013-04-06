class UserEmailHash < ActiveRecord::Base
  attr_accessible :user_id, :hash_text
  belongs_to :user
end
