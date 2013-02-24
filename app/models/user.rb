class User < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :facebook_id, :email, :username
  has_many :stories
  has_many :bookmarks


  def self.authenticate(username, password, salt='salt')
    @user = User.find_by_username(username)
    return false unless @user.present?
    hashed_password =  Digest::MD5.hexdigest(password + salt)
    return @user if @user.user_auth.password == hashed_password
    false
  end
end
