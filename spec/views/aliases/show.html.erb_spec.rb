require 'spec_helper'

describe "aliases/show.html.erb" do
  before(:each) do
    @alias = assign(:alias, stub_model(Alias,
      :user_id => 1,
      :alias => "Alias"
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain(1.to_s)
    rendered.should contain("Alias".to_s)
  end
end
