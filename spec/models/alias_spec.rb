require 'spec_helper'

describe Alias do
  before(:each) do
    Domain.create(:domain => "example.com")
    user = User.create(:login => "user@example.com", :password => "example")

    @alias = user.aliases.new(:alias => "mail@example.com")
  end

  it "is valid with valid attributes" do
    @alias.should be_valid
  end

  it "is not valid without an alias" do
    @alias.alias = nil
    @alias.should_not be_valid
  end

  it "is not valid without a user" do
    @alias.user = nil
    @alias.should_not be_valid
  end

  it "should use an existing domain as part of the alias" do
    @alias.alias = "mail@example.org"
    @alias.should_not be_valid
  end

  it "returns the domain part of the alias" do
    @alias.alias_domain.should == "example.com"
  end

  it "returns the name part of the alias" do
    @alias.alias_name.should == "mail"
  end
end
