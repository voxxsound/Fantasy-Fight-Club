require 'spec_helper'

describe FightersController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/fighters" }.should route_to(:controller => "fighters", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/fighters/new" }.should route_to(:controller => "fighters", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/fighters/1" }.should route_to(:controller => "fighters", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/fighters/1/edit" }.should route_to(:controller => "fighters", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/fighters" }.should route_to(:controller => "fighters", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/fighters/1" }.should route_to(:controller => "fighters", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/fighters/1" }.should route_to(:controller => "fighters", :action => "destroy", :id => "1") 
    end
  end
end
