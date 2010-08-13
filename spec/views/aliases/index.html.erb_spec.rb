require 'spec_helper'

describe "aliases/index.html.erb" do
  before(:each) do
    user = stub_model(User, :login => "user@example.com")

    alias1 = stub_model(Alias, :user => user, :user_id => 1, :alias => "Alias")
    alias1.stub(:login).and_return(user.login)

    alias2 = stub_model(Alias, :user => user, :user_id => 1, :alias => "Alias")
    alias2.stub(:login).and_return(user.login)

    assign(:aliases, [alias1, alias2])
  end

  it "renders a list of aliases" do
    render
    rendered.should have_selector("tr>td", :content => "user@example.com".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "Alias".to_s, :count => 2)
  end
end
