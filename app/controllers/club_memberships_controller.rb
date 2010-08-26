class ClubMembershipsController < ApplicationController
  # GET /club_memberships
  # GET /club_memberships.xml
  def index
    @club_memberships = ClubMembership.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @club_memberships }
    end
  end

  # GET /club_memberships/1
  # GET /club_memberships/1.xml
  def show
    @club_membership = ClubMembership.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @club_membership }
    end
  end

  # GET /club_memberships/new
  # GET /club_memberships/new.xml
  def new
    @club_membership = ClubMembership.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @club_membership }
    end
  end

  # GET /club_memberships/1/edit
  def edit
    @club_membership = ClubMembership.find(params[:id])
  end

  # POST /club_memberships
  # POST /club_memberships.xml
  def create
    @club_membership = ClubMembership.new(params[:club_membership])

    respond_to do |format|
      if @club_membership.save
        format.html { redirect_to(@club_membership, :notice => 'ClubMembership was successfully created.') }
        format.xml  { render :xml => @club_membership, :status => :created, :location => @club_membership }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @club_membership.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /club_memberships/1
  # PUT /club_memberships/1.xml
  def update
    @club_membership = ClubMembership.find(params[:id])

    respond_to do |format|
      if @club_membership.update_attributes(params[:club_membership])
        format.html { redirect_to(@club_membership, :notice => 'ClubMembership was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @club_membership.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /club_memberships/1
  # DELETE /club_memberships/1.xml
  def destroy
    @club_membership = ClubMembership.find(params[:id])
    @club_membership.destroy

    respond_to do |format|
      format.html { redirect_to(club_memberships_url) }
      format.xml  { head :ok }
    end
  end
end
