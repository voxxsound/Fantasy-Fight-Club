require 'spec_helper'

describe LeaguesController do

  def mock_league(stubs={})
    @mock_league ||= mock_model(League, stubs)
  end

  describe "GET index" do
    it "assigns all leagues as @leagues" do
      League.stub(:find).with(:all).and_return([mock_league])
      get :index
      assigns[:leagues].should == [mock_league]
    end
  end

  describe "GET show" do
    it "assigns the requested league as @league" do
      League.stub(:find).with("37").and_return(mock_league)
      get :show, :id => "37"
      assigns[:league].should equal(mock_league)
    end
  end

  describe "GET new" do
    it "assigns a new league as @league" do
      League.stub(:new).and_return(mock_league)
      get :new
      assigns[:league].should equal(mock_league)
    end
  end

  describe "GET edit" do
    it "assigns the requested league as @league" do
      League.stub(:find).with("37").and_return(mock_league)
      get :edit, :id => "37"
      assigns[:league].should equal(mock_league)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created league as @league" do
        League.stub(:new).with({'these' => 'params'}).and_return(mock_league(:save => true))
        post :create, :league => {:these => 'params'}
        assigns[:league].should equal(mock_league)
      end

      it "redirects to the created league" do
        League.stub(:new).and_return(mock_league(:save => true))
        post :create, :league => {}
        response.should redirect_to(league_url(mock_league))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved league as @league" do
        League.stub(:new).with({'these' => 'params'}).and_return(mock_league(:save => false))
        post :create, :league => {:these => 'params'}
        assigns[:league].should equal(mock_league)
      end

      it "re-renders the 'new' template" do
        League.stub(:new).and_return(mock_league(:save => false))
        post :create, :league => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested league" do
        League.should_receive(:find).with("37").and_return(mock_league)
        mock_league.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :league => {:these => 'params'}
      end

      it "assigns the requested league as @league" do
        League.stub(:find).and_return(mock_league(:update_attributes => true))
        put :update, :id => "1"
        assigns[:league].should equal(mock_league)
      end

      it "redirects to the league" do
        League.stub(:find).and_return(mock_league(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(league_url(mock_league))
      end
    end

    describe "with invalid params" do
      it "updates the requested league" do
        League.should_receive(:find).with("37").and_return(mock_league)
        mock_league.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :league => {:these => 'params'}
      end

      it "assigns the league as @league" do
        League.stub(:find).and_return(mock_league(:update_attributes => false))
        put :update, :id => "1"
        assigns[:league].should equal(mock_league)
      end

      it "re-renders the 'edit' template" do
        League.stub(:find).and_return(mock_league(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested league" do
      League.should_receive(:find).with("37").and_return(mock_league)
      mock_league.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the leagues list" do
      League.stub(:find).and_return(mock_league(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(leagues_url)
    end
  end

end
