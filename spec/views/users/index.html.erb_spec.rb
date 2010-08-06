require 'spec_helper'

describe "users/index.html.erb" do
  before(:each) do
    assign(:users, [
      stub_model(User,
        :login => "Login",
        :password => "Password",
        :active => false
      ),
      stub_model(User,
        :login => "Login",
        :password => "Password",
        :active => false
      )
    ])
  end

  it "renders a list of users" do
    render
    rendered.should have_selector("tr>td", :content => "Login".to_s, :count => 2)
  end
end
