require 'spec_helper'

describe ClubMembershipsController do

  def mock_club_membership(stubs={})
    @mock_club_membership ||= mock_model(ClubMembership, stubs)
  end

  describe "GET index" do
    it "assigns all club_memberships as @club_memberships" do
      ClubMembership.stub(:find).with(:all).and_return([mock_club_membership])
      get :index
      assigns[:club_memberships].should == [mock_club_membership]
    end
  end

  describe "GET show" do
    it "assigns the requested club_membership as @club_membership" do
      ClubMembership.stub(:find).with("37").and_return(mock_club_membership)
      get :show, :id => "37"
      assigns[:club_membership].should equal(mock_club_membership)
    end
  end

  describe "GET new" do
    it "assigns a new club_membership as @club_membership" do
      ClubMembership.stub(:new).and_return(mock_club_membership)
      get :new
      assigns[:club_membership].should equal(mock_club_membership)
    end
  end

  describe "GET edit" do
    it "assigns the requested club_membership as @club_membership" do
      ClubMembership.stub(:find).with("37").and_return(mock_club_membership)
      get :edit, :id => "37"
      assigns[:club_membership].should equal(mock_club_membership)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created club_membership as @club_membership" do
        ClubMembership.stub(:new).with({'these' => 'params'}).and_return(mock_club_membership(:save => true))
        post :create, :club_membership => {:these => 'params'}
        assigns[:club_membership].should equal(mock_club_membership)
      end

      it "redirects to the created club_membership" do
        ClubMembership.stub(:new).and_return(mock_club_membership(:save => true))
        post :create, :club_membership => {}
        response.should redirect_to(club_membership_url(mock_club_membership))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved club_membership as @club_membership" do
        ClubMembership.stub(:new).with({'these' => 'params'}).and_return(mock_club_membership(:save => false))
        post :create, :club_membership => {:these => 'params'}
        assigns[:club_membership].should equal(mock_club_membership)
      end

      it "re-renders the 'new' template" do
        ClubMembership.stub(:new).and_return(mock_club_membership(:save => false))
        post :create, :club_membership => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested club_membership" do
        ClubMembership.should_receive(:find).with("37").and_return(mock_club_membership)
        mock_club_membership.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :club_membership => {:these => 'params'}
      end

      it "assigns the requested club_membership as @club_membership" do
        ClubMembership.stub(:find).and_return(mock_club_membership(:update_attributes => true))
        put :update, :id => "1"
        assigns[:club_membership].should equal(mock_club_membership)
      end

      it "redirects to the club_membership" do
        ClubMembership.stub(:find).and_return(mock_club_membership(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(club_membership_url(mock_club_membership))
      end
    end

    describe "with invalid params" do
      it "updates the requested club_membership" do
        ClubMembership.should_receive(:find).with("37").and_return(mock_club_membership)
        mock_club_membership.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :club_membership => {:these => 'params'}
      end

      it "assigns the club_membership as @club_membership" do
        ClubMembership.stub(:find).and_return(mock_club_membership(:update_attributes => false))
        put :update, :id => "1"
        assigns[:club_membership].should equal(mock_club_membership)
      end

      it "re-renders the 'edit' template" do
        ClubMembership.stub(:find).and_return(mock_club_membership(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested club_membership" do
      ClubMembership.should_receive(:find).with("37").and_return(mock_club_membership)
      mock_club_membership.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the club_memberships list" do
      ClubMembership.stub(:find).and_return(mock_club_membership(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(club_memberships_url)
    end
  end

end
