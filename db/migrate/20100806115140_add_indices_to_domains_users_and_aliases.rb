class AddIndicesToDomainsUsersAndAliases < ActiveRecord::Migration
  def self.up
    add_index :domains, :domain, :unique => true
    add_index :users, :login, :unique => true
    add_index :aliases, :alias, :unique => true
  end

  def self.down
    remove_index :aliases, :column => :alias
    remove_index :users, :column => :login
    remove_index :domains, :column => :domain
  end
end
