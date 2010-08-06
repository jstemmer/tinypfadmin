require 'spec_helper'

describe User do
  before(:each) do
    Domain.create(:domain => "example.com")
    @user = User.new(:login => "user@example.com", :password => "example")
  end

  it "should return the domain part of the login name" do
    @user.login_domain.should == "example.com"
  end

  it "should return the user part of the login name" do
    @user.login_name.should == "user"
  end

  context "a new user" do
    it "is valid with valid attributes" do
      @user.should be_valid
    end

    it "is not valid without a login name" do
      @user.login = nil
      @user.should_not be_valid
    end

    it "is not valid without a password" do
      @user.password = nil
      @user.should_not be_valid
    end

    it "should have an email address as login name" do
      @user.login = "username"
      @user.should_not be_valid
    end

    it "should use an existing domain as part of the login name" do
      @user.login = "user@example.org"
      @user.should_not be_valid
    end
  end

  context "an existing user" do
    it "should not be deleted if it has aliases" do
      pending
    end
  end
end
