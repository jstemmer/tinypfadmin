class Domain < ActiveRecord::Base
  validates_presence_of :domain
  validates_format_of :domain, :with => /^([a-z0-9-]+\.)+[a-z0-9-]+$/
  validates_uniqueness_of :domain, :case_sensitive => false

  def domain=(d)
    write_attribute(:domain, d.downcase)
  end
end
