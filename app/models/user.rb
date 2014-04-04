require 'bcrypt'
class User < ActiveRecord::Base
  include BCrypt
  validates_uniqueness_of :email
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create

  has_many :tweets
  has_many :followers

  def password
    @password ||= Password.create(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
    p @password
  end

  def create
    @user = User.new(params[:user])
    @user.password = params[:password]
    @user.save!
  end

  def login
    @user = User.find_by_email(params[:email])
    if @user.password == params[:password]
      redirect '/'
    else
      redirect '/'
    end
  end



end
