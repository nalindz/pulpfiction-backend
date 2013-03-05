class User < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :facebook_id, :email, :username
  has_many :stories
  has_many :bookmarks
  after_create :assign_username

  validates :username, 
    :length => { :within => 3..15,
    :too_short => "TOO_SHORT",
    :too_long => "TOO_LONG" },
    :format => { :with => /^([a-zA-Z]([._]?[a-zA-Z0-9]+)*[._]?|[._]([a-zA-Z0-9]+[._]?)*)$/,
      :message => "INVALID_CHARS" }

  def assign_username
    return if first_name.blank?
    base_username = first_name[0] + last_name
    suffix_number = ''

    # search for users with same username
    while (User.find_by_username(base_username + suffix_number))
      suffix_number = (suffix_number.to_i + 1).to_s
    end

    self.username = base_username + suffix_number
    save!
  end

  # note: not using this stuff yet
  def self.authenticate(username, password, salt='salt')
    @user = User.find_by_username(username)
    return false unless @user.present?
    hashed_password =  Digest::MD5.hexdigest(password + salt)
    return @user if @user.user_auth.password == hashed_password
    false
  end
end
