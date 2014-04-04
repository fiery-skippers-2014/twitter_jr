

class User < ActiveRecord::Base

  include Gravtastic
  gravtastic  :secure => true,
              :filetype => :gif,
              :size => 240






  include BCrypt
  validates_uniqueness_of :email
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create

  has_many :tweets
  has_many :followers

  def self.create(params)
    @user = self.new(params)
    @user.password = params[:password_hash]
    @user.save!
  end

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password) #encrypts the new password
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.fetch_gravatar(user_id) # goop
    current_user = User.find(user_id)
    current_user.gravatar_url
  end


end

