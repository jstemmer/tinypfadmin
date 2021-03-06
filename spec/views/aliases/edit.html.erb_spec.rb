require 'spec_helper'

describe "aliases/edit.html.erb" do
  before(:each) do
    assign(:users, [["user@example.org", 1]])
    @alias = assign(:alias, stub_model(Alias,
      :new_record? => false,
      :user_id => 1,
      :alias => "MyString"
    ))
  end

  it "renders the edit alias form" do
    render

    rendered.should have_selector("form", :action => alias_path(@alias), :method => "post") do |form|
      form.should have_selector("select#alias_user_id", :name => "alias[user_id]")
      form.should have_selector("select#alias_user_id>option", :content => "user@example.org", :value => 1.to_s, :selected => "selected")
      form.should have_selector("input#alias_alias", :name => "alias[alias]")
    end
  end
end
