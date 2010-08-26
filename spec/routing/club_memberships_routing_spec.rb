require 'spec_helper'

describe ClubMembershipsController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/club_memberships" }.should route_to(:controller => "club_memberships", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/club_memberships/new" }.should route_to(:controller => "club_memberships", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/club_memberships/1" }.should route_to(:controller => "club_memberships", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/club_memberships/1/edit" }.should route_to(:controller => "club_memberships", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/club_memberships" }.should route_to(:controller => "club_memberships", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/club_memberships/1" }.should route_to(:controller => "club_memberships", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/club_memberships/1" }.should route_to(:controller => "club_memberships", :action => "destroy", :id => "1") 
    end
  end
end
