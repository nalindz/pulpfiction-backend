class User < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :facebook_id, :email, :username, :state
  has_many :stories
  has_many :bookmarks
  has_one :email_hash, :class_name => "UserEmailHash"
  has_one :stat, :class_name => "UserStat"
  after_create :assign_email_hash
  after_create :create_user_stat

  include UserState

  validates :username, 
    :length => { :within => 3..15,
    :too_short => "TOO_SHORT",
    :too_long => "TOO_LONG" },
    :format => { :with => /^([a-zA-Z]([._]?[a-zA-Z0-9]+)*[._]?|[._]([a-zA-Z0-9]+[._]?)*)$/,
      :message => "INVALID_CHARS" },
    :uniqueness => { :message => "ALREADY_TAKEN" }

  def assign_username
    return if first_name.blank?
    base_username = first_name[0] + last_name
    suffix_number = ''

    # search for users with same username
    while (User.find_by_username(base_username + suffix_number))
      suffix_number = (suffix_number.to_i + 1).to_s
    end

    self.username = base_username.downcase + suffix_number
    save!
  end

  def assign_email_hash
    o = [('a'..'z')].map{|i| i.to_a}.flatten
    string = (0..3).map{ o[rand(o.length)] }.join
    UserEmailHash.create!(user_id: id, hash_text: string)
  end

  def create_user_stat
    UserStat.create!(user: self)
  end

  # note: not using this stuff yet
  def self.authenticate(username, password, salt='salt')
    @user = User.find_by_username(username)
    return false unless @user.present?
    hashed_password =  Digest::MD5.hexdigest(password + salt)
    return @user if @user.user_auth.password == hashed_password
    false
  end

  def as_json(options={})
    json = self.attributes
    if options[:current_user]
      json = json.merge({"email_hash" => email_hash.hash_text,
                        "stat" => stat})
    end
    json
  end
end
