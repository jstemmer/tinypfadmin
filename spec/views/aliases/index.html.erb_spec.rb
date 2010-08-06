require 'spec_helper'

describe "aliases/index.html.erb" do
  before(:each) do
    user = stub_model(User, :login => "user@example.com")

    assign(:aliases, [
      stub_model(Alias,
        :user => user,
        :user_id => 1,
        :alias => "Alias"
      ),
      stub_model(Alias,
        :user => user,
        :user_id => 1,
        :alias => "Alias"
      )
    ])
  end

  it "renders a list of aliases" do
    render
    rendered.should have_selector("tr>td", :content => "user@example.com".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "Alias".to_s, :count => 2)
  end
end
