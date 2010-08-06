require 'spec_helper'

describe "users/show.html.erb" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :login => "Login",
      :password => "Password",
      :active => false
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain("Login".to_s)
    rendered.should contain("Password".to_s)
    rendered.should contain(false.to_s)
  end
end
