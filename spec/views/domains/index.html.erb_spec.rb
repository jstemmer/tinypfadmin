require 'spec_helper'

describe "domains/index.html.erb" do
  before(:each) do
    assign(:domains, [
      stub_model(Domain,
        :domain => "domain1.example.org"
      ),
      stub_model(Domain,
        :domain => "domain2.example.org"
      )
    ])
  end

  it "renders a list of domains" do
    render
    rendered.should have_selector("tr>td", :content => "domain1.example.org".to_s, :count => 1)
    rendered.should have_selector("tr>td", :content => "domain2.example.org".to_s, :count => 1)
  end
end
