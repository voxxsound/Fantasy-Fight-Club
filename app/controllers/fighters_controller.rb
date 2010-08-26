class FightersController < ApplicationController
  # GET /fighters
  # GET /fighters.xml
  def index
    @fighters = Fighter.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @fighters }
    end
  end

  # GET /fighters/1
  # GET /fighters/1.xml
  def show
    @fighter = Fighter.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @fighter }
    end
  end

  # GET /fighters/new
  # GET /fighters/new.xml
  def new
    @fighter = Fighter.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @fighter }
    end
  end

  # GET /fighters/1/edit
  def edit
    @fighter = Fighter.find(params[:id])
  end

  # POST /fighters
  # POST /fighters.xml
  def create
    @fighter = Fighter.new(params[:fighter])

    respond_to do |format|
      if @fighter.save
        format.html { redirect_to(@fighter, :notice => 'Fighter was successfully created.') }
        format.xml  { render :xml => @fighter, :status => :created, :location => @fighter }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @fighter.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /fighters/1
  # PUT /fighters/1.xml
  def update
    @fighter = Fighter.find(params[:id])

    respond_to do |format|
      if @fighter.update_attributes(params[:fighter])
        format.html { redirect_to(@fighter, :notice => 'Fighter was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @fighter.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /fighters/1
  # DELETE /fighters/1.xml
  def destroy
    @fighter = Fighter.find(params[:id])
    @fighter.destroy

    respond_to do |format|
      format.html { redirect_to(fighters_url) }
      format.xml  { head :ok }
    end
  end
end
