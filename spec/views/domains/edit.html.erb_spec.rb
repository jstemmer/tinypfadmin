require 'spec_helper'

describe "domains/edit.html.erb" do
  before(:each) do
    @domain = assign(:domain, stub_model(Domain,
      :new_record? => false,
      :domain => "MyString"
    ))
  end

  it "renders the edit domain form" do
    render

    rendered.should have_selector("form", :action => domain_path(@domain), :method => "post") do |form|
      form.should have_selector("input#domain_domain", :name => "domain[domain]")
    end
  end
end
