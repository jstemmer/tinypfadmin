require 'spec_helper'

describe "domains/index.html.erb" do
  before(:each) do
    assign(:domains, [
      stub_model(Domain,
        :domain => "Domain"
      ),
      stub_model(Domain,
        :domain => "Domain"
      )
    ])
  end

  it "renders a list of domains" do
    render
    rendered.should have_selector("tr>td", :content => "Domain".to_s, :count => 2)
  end
end
