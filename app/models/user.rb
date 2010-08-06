class User < ActiveRecord::Base
  validates_presence_of :login, :message => "is required"
  validates_format_of :login, :with => /^[a-z0-9\-_\+]+@([a-z0-9\-]+\.)+[a-z0-9\-]+$/, :message => "is not an email address"
  validate :login_domain_exists
  validates_presence_of :password, :message => "is required"

  has_many :aliases

  def is_active?
    self.active
  end

  def password=(pwd)
    write_attribute(:password, mysql_encrypt(pwd))
  end

  def login_domain
    self.login.split('@').last if self.login && self.login.include?('@')
  end
  
  def login_name
    self.login.split('@').first if self.login && self.login.include?('@')
  end

  def login_domain_exists
    errors.add(:login, 'uses an unknown domain') unless Domain.exists?(:domain => self.login_domain)
  end

  private

  def mysql_encrypt(pwd)
    salt = ActiveSupport::SecureRandom.hex(4)
    pwd.crypt(salt) unless pwd.nil?
  end
end
