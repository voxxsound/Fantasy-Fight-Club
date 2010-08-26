require 'spec_helper'

describe PartiesController do

  def mock_party(stubs={})
    @mock_party ||= mock_model(Party, stubs)
  end

  describe "GET index" do
    it "assigns all parties as @parties" do
      Party.stub(:find).with(:all).and_return([mock_party])
      get :index
      assigns[:parties].should == [mock_party]
    end
  end

  describe "GET show" do
    it "assigns the requested party as @party" do
      Party.stub(:find).with("37").and_return(mock_party)
      get :show, :id => "37"
      assigns[:party].should equal(mock_party)
    end
  end

  describe "GET new" do
    it "assigns a new party as @party" do
      Party.stub(:new).and_return(mock_party)
      get :new
      assigns[:party].should equal(mock_party)
    end
  end

  describe "GET edit" do
    it "assigns the requested party as @party" do
      Party.stub(:find).with("37").and_return(mock_party)
      get :edit, :id => "37"
      assigns[:party].should equal(mock_party)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created party as @party" do
        Party.stub(:new).with({'these' => 'params'}).and_return(mock_party(:save => true))
        post :create, :party => {:these => 'params'}
        assigns[:party].should equal(mock_party)
      end

      it "redirects to the created party" do
        Party.stub(:new).and_return(mock_party(:save => true))
        post :create, :party => {}
        response.should redirect_to(party_url(mock_party))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved party as @party" do
        Party.stub(:new).with({'these' => 'params'}).and_return(mock_party(:save => false))
        post :create, :party => {:these => 'params'}
        assigns[:party].should equal(mock_party)
      end

      it "re-renders the 'new' template" do
        Party.stub(:new).and_return(mock_party(:save => false))
        post :create, :party => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested party" do
        Party.should_receive(:find).with("37").and_return(mock_party)
        mock_party.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :party => {:these => 'params'}
      end

      it "assigns the requested party as @party" do
        Party.stub(:find).and_return(mock_party(:update_attributes => true))
        put :update, :id => "1"
        assigns[:party].should equal(mock_party)
      end

      it "redirects to the party" do
        Party.stub(:find).and_return(mock_party(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(party_url(mock_party))
      end
    end

    describe "with invalid params" do
      it "updates the requested party" do
        Party.should_receive(:find).with("37").and_return(mock_party)
        mock_party.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :party => {:these => 'params'}
      end

      it "assigns the party as @party" do
        Party.stub(:find).and_return(mock_party(:update_attributes => false))
        put :update, :id => "1"
        assigns[:party].should equal(mock_party)
      end

      it "re-renders the 'edit' template" do
        Party.stub(:find).and_return(mock_party(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested party" do
      Party.should_receive(:find).with("37").and_return(mock_party)
      mock_party.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the parties list" do
      Party.stub(:find).and_return(mock_party(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(parties_url)
    end
  end

end
