class Alias < ActiveRecord::Base
  validates_presence_of :alias, :user
  validate :alias_domain_exists

  belongs_to :user

  def alias_domain
    self.alias.split('@').last if self.alias && self.alias.include?('@')
  end

  def alias_name
    self.alias.split('@').first if self.alias && self.alias.include?('@')
  end

  def alias_domain_exists
    errors.add(:alias, 'uses an unknown domain') unless Domain.exists?(:domain => self.alias_domain)
  end
end
