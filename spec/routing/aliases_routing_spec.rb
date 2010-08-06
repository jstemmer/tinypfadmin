require "spec_helper"

describe AliasesController do
  describe "routing" do

        it "recognizes and generates #index" do
      { :get => "/aliases" }.should route_to(:controller => "aliases", :action => "index")
    end

        it "recognizes and generates #new" do
      { :get => "/aliases/new" }.should route_to(:controller => "aliases", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/aliases/1" }.should route_to(:controller => "aliases", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/aliases/1/edit" }.should route_to(:controller => "aliases", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/aliases" }.should route_to(:controller => "aliases", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/aliases/1" }.should route_to(:controller => "aliases", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/aliases/1" }.should route_to(:controller => "aliases", :action => "destroy", :id => "1")
    end

  end
end
