require 'spec_helper'

describe AliasesController do

  def mock_alias(stubs={})
    @mock_alias ||= mock_model(Alias, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all aliases as @aliases" do
      Alias.stub(:joins).and_return(Alias)
      Alias.stub(:order).and_return(Alias)
      Alias.stub(:select).and_return(Alias)

      Alias.stub(:all) { [mock_alias] }
      get :index
      assigns(:aliases).should eq([mock_alias])
    end
  end

  describe "GET show" do
    it "assigns the requested alias as @alias" do
      Alias.stub(:find).with("37") { mock_alias }
      get :show, :id => "37"
      assigns(:alias).should be(mock_alias)
    end
  end

  describe "GET new" do
    it "assigns a new alias as @alias" do
      Alias.stub(:new) { mock_alias }
      get :new
      assigns(:alias).should be(mock_alias)
    end
  end

  describe "GET edit" do
    it "assigns the requested alias as @alias" do
      Alias.stub(:find).with("37") { mock_alias }
      get :edit, :id => "37"
      assigns(:alias).should be(mock_alias)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created alias as @alias" do
        Alias.stub(:new).with({'these' => 'params'}) { mock_alias(:save => true) }
        post :create, :alias => {'these' => 'params'}
        assigns(:alias).should be(mock_alias)
      end

      it "redirects to the created alias" do
        Alias.stub(:new) { mock_alias(:save => true) }
        post :create, :alias => {}
        response.should redirect_to(aliases_url)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved alias as @alias" do
        Alias.stub(:new).with({'these' => 'params'}) { mock_alias(:save => false) }
        post :create, :alias => {'these' => 'params'}
        assigns(:alias).should be(mock_alias)
      end

      it "re-renders the 'new' template" do
        Alias.stub(:new) { mock_alias(:save => false) }
        post :create, :alias => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested alias" do
        Alias.should_receive(:find).with("37") { mock_alias }
        mock_alias.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :alias => {'these' => 'params'}
      end

      it "assigns the requested alias as @alias" do
        Alias.stub(:find) { mock_alias(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:alias).should be(mock_alias)
      end

      it "redirects to the alias" do
        Alias.stub(:find) { mock_alias(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(aliases_url)
      end
    end

    describe "with invalid params" do
      it "assigns the alias as @alias" do
        Alias.stub(:find) { mock_alias(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:alias).should be(mock_alias)
      end

      it "re-renders the 'edit' template" do
        Alias.stub(:find) { mock_alias(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested alias" do
      Alias.should_receive(:find).with("37") { mock_alias }
      mock_alias.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the aliases list" do
      Alias.stub(:find) { mock_alias }
      delete :destroy, :id => "1"
      response.should redirect_to(aliases_url)
    end
  end

end
