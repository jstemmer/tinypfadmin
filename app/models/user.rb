class User < ActiveRecord::Base
  validates_presence_of :login, :message => "is required"
  validates_format_of :login, :with => /^[a-z0-9\-_\+]+@([a-z0-9\-]+\.)+[a-z0-9\-]+$/, :message => "is not an email address"
  validate :login_domain_exists
  validates_presence_of :password, :message => "is required"

  has_many :aliases

  def login_domain
    login.split('@').last if login && login.include?('@')
  end
  
  def login_name
    login.split('@').first if login && login.include?('@')
  end

  def login_domain_exists
    errors.add(:login, 'uses an unknown domain') unless Domain.exists?(:domain => self.login_domain)
  end
end
