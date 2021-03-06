class AliasesController < ApplicationController
  # GET /aliases
  # GET /aliases.xml
  def index
    @aliases = Alias.joins(:user).order(:login, :alias).select("aliases.*, users.login").all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @aliases }
    end
  end

  # GET /aliases/1
  # GET /aliases/1.xml
  def show
    @alias = Alias.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @alias }
    end
  end

  # GET /aliases/new
  # GET /aliases/new.xml
  def new
    @alias = Alias.new
    @users = User.all.collect { |u| [u.login, u.id] }

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @alias }
    end
  end

  # GET /aliases/1/edit
  def edit
    @alias = Alias.find(params[:id])
    @users = User.all.collect { |u| [u.login, u.id] }
  end

  # POST /aliases
  # POST /aliases.xml
  def create
    @alias = Alias.new(params[:alias])

    respond_to do |format|
      if @alias.save
        format.html { redirect_to(aliases_url, :notice => 'Alias was successfully created.') }
        format.xml  { render :xml => @alias, :status => :created, :location => @alias }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @alias.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /aliases/1
  # PUT /aliases/1.xml
  def update
    @alias = Alias.find(params[:id])

    respond_to do |format|
      if @alias.update_attributes(params[:alias])
        format.html { redirect_to(aliases_url, :notice => 'Alias was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @alias.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /aliases/1
  # DELETE /aliases/1.xml
  def destroy
    @alias = Alias.find(params[:id])
    @alias.destroy

    respond_to do |format|
      format.html { redirect_to(aliases_url) }
      format.xml  { head :ok }
    end
  end
end
