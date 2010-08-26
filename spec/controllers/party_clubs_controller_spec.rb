require 'spec_helper'

describe PartyClubsController do

  def mock_club(stubs={})
    @mock_club ||= mock_model(Club, stubs)
  end

  describe "GET index" do
    it "assigns all clubs as @clubs" do
      Club.stub(:find).with(:all).and_return([mock_club])
      get :index
      assigns[:clubs].should == [mock_club]
    end
  end
  
  describe "party actions" do
    before(:each) do
      @party = Party.new
      Party.stub(:find).with("37").and_return(@party)
    end
    
    describe "GET show" do
      it "assigns the requested club as @club" do
        Club.stub(:find).with("37").and_return(mock_club)
        get :show, :id => "37"
        assigns[:club].should equal(mock_club)
      end
      
      it "assigns the requested club as @party" do
        @party.clubs.stub(:find).and_return()
      end
    end

    describe "GET new" do
      it "assigns the related party as @party" do
        Club.stub(:new).and_return(mock_club)
        Party.stub(:find).and_return(Party.new)
      end

      it "assigns a new club as @club" do
        Club.stub(:new).and_return(mock_club)
        get :new
        assigns[:club].should equal(mock_club)
      end
    end

    describe "GET edit" do

      it "assigns the requested club as @club" do
        @party.clubs.stub(:find).with("37").and_return(mock_club)
        get :edit, :id => "37"
        assigns[:club].should equal(mock_club)
      end
    end

    describe "POST create" do

      describe "with valid params" do
        it "assigns a newly created club as @club" do
          @party.clubs.stub(:build).with({'these' => 'params'}).and_return(mock_club(:save => true))
          post :create, :club => {:these => 'params'}
          assigns[:club].should equal(mock_club)
        end

        it "redirects to the created club" do
          @party.clubs.stub(:build).and_return(mock_club(:save => true))
          post :create, :club => {}
          response.should redirect_to(club_url(mock_club))
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved club as @club" do
          @party.clubs.stub(:new).with({'these' => 'params'}).and_return(mock_club(:save => false))
          post :create, :club => {:these => 'params'}
          assigns[:club].should equal(mock_club)
        end

        it "re-renders the 'new' template" do
          @party.clubs.stub(:new).and_return(mock_club(:save => false))
          post :create, :club => {}
          response.should render_template('new')
        end
      end

    end

    describe "PUT update" do

      describe "with valid params" do
        it "updates the requested club" do
          Club.should_receive(:find).with("37").and_return(mock_club)
          mock_club.should_receive(:update_attributes).with({'these' => 'params'})
          put :update, :id => "37", :club => {:these => 'params'}
        end

        it "assigns the requested club as @club" do
          Club.stub(:find).and_return(mock_club(:update_attributes => true))
          put :update, :id => "1"
          assigns[:club].should equal(mock_club)
        end

        it "redirects to the club" do
          Club.stub(:find).and_return(mock_club(:update_attributes => true))
          put :update, :id => "1"
          response.should redirect_to(club_url(mock_club))
        end
      end

      describe "with invalid params" do
        it "updates the requested club" do
          Club.should_receive(:find).with("37").and_return(mock_club)
          mock_club.should_receive(:update_attributes).with({'these' => 'params'})
          put :update, :id => "37", :club => {:these => 'params'}
        end

        it "assigns the club as @club" do
          Club.stub(:find).and_return(mock_club(:update_attributes => false))
          put :update, :id => "1"
          assigns[:club].should equal(mock_club)
        end

        it "re-renders the 'edit' template" do
          Club.stub(:find).and_return(mock_club(:update_attributes => false))
          put :update, :id => "1"
          response.should render_template('edit')
        end
      end

    end

    describe "DELETE destroy" do
      it "destroys the requested club" do
        Club.should_receive(:find).with("37").and_return(mock_club)
        mock_club.should_receive(:destroy)
        delete :destroy, :id => "37"
      end

      it "redirects to the clubs list" do
        Club.stub(:find).and_return(mock_club(:destroy => true))
        delete :destroy, :id => "1"
        response.should redirect_to(clubs_url)
      end
    end
    
  end

end
