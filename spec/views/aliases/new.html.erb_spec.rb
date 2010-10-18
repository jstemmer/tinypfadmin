require 'spec_helper'

describe "aliases/new.html.erb" do
  before(:each) do
    assign(:users, [["user@example.org", 1]])
    @alias = assign(:alias, stub_model(Alias,
      :new_record? => true
    ))
  end

  it "renders new alias form" do
    render

    rendered.should have_selector("form", :action => alias_path(@alias), :method => "post") do |form|
      form.should have_selector("select#alias_user_id", :name => "alias[user_id]")
      form.should have_selector("select#alias_user_id>option", :content => "user@example.org", :value => 1.to_s)
      form.should have_selector("input#alias_alias", :name => "alias[alias]")
    end
  end
end
