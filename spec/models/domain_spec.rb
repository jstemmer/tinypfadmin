require 'spec_helper'

describe Domain do
  context "a new domain" do
    before(:each) do
      @domain = Domain.new
    end

    it "should have a domain name" do
      @domain.should_not be_valid
      @domain.domain = 'example.com'
      @domain.should be_valid
    end

    it "should have a unique domain name, case insensitive" do
      Domain.create(:domain => 'example.com')

      @domain.domain = 'example.com'
      @domain.should_not be_valid

      @domain.domain = 'EXAMPLE.com'
      @domain.should_not be_valid

      @domain.domain = 'example.org'
      @domain.should be_valid
    end

    it "should only contain letters, digits and hyphens" do
      '!@#$%^&*()_+=/\\'.each_char do |d|
        @domain.domain = d + 'example.com'
        @domain.should_not be_valid
      end
    end

    it "should contain a TLD" do
      @domain.domain = 'example'
      @domain.should_not be_valid

      @domain.domain = 'com'
      @domain.should_not be_valid
    end

    it "should allow subdomains" do
      @domain.domain = 'subdomain.example.com'
      @domain.should be_valid
    end
  end

  context "an existing domain" do
    it "should store the domain in lowercase" do
      @domain = Domain.create(:domain => 'Example.Com')
      @domain.domain.should == 'example.com'
    end

    it "should not be changed while it has users or aliases" do
      pending
    end

    it "should not be deleted while it has users or aliases" do
      pending
    end
  end
end
