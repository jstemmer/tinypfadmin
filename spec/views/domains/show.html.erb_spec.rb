require 'spec_helper'

describe "domains/show.html.erb" do
  before(:each) do
    @domain = assign(:domain, stub_model(Domain,
      :domain => "Domain"
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain("Domain".to_s)
  end
end
