require 'spec_helper'

describe "aliases/show.html.erb" do
  before(:each) do
    user = stub_model(User, :login => "user@example.com")

    @alias = assign(:alias, stub_model(Alias,
      :user => user,
      :user_id => 1,
      :alias => "Alias"
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain("user@example.com".to_s)
    rendered.should contain("Alias".to_s)
  end
end
