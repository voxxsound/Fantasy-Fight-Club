require 'spec_helper'

describe FightersController do

  def mock_fighter(stubs={})
    @mock_fighter ||= mock_model(Fighter, stubs)
  end

  describe "GET index" do
    it "assigns all fighters as @fighters" do
      Fighter.stub(:find).with(:all).and_return([mock_fighter])
      get :index
      assigns[:fighters].should == [mock_fighter]
    end
  end

  describe "GET show" do
    it "assigns the requested fighter as @fighter" do
      Fighter.stub(:find).with("37").and_return(mock_fighter)
      get :show, :id => "37"
      assigns[:fighter].should equal(mock_fighter)
    end
  end

  describe "GET new" do
    it "assigns a new fighter as @fighter" do
      Fighter.stub(:new).and_return(mock_fighter)
      get :new
      assigns[:fighter].should equal(mock_fighter)
    end
  end

  describe "GET edit" do
    it "assigns the requested fighter as @fighter" do
      Fighter.stub(:find).with("37").and_return(mock_fighter)
      get :edit, :id => "37"
      assigns[:fighter].should equal(mock_fighter)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created fighter as @fighter" do
        Fighter.stub(:new).with({'these' => 'params'}).and_return(mock_fighter(:save => true))
        post :create, :fighter => {:these => 'params'}
        assigns[:fighter].should equal(mock_fighter)
      end

      it "redirects to the created fighter" do
        Fighter.stub(:new).and_return(mock_fighter(:save => true))
        post :create, :fighter => {}
        response.should redirect_to(fighter_url(mock_fighter))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved fighter as @fighter" do
        Fighter.stub(:new).with({'these' => 'params'}).and_return(mock_fighter(:save => false))
        post :create, :fighter => {:these => 'params'}
        assigns[:fighter].should equal(mock_fighter)
      end

      it "re-renders the 'new' template" do
        Fighter.stub(:new).and_return(mock_fighter(:save => false))
        post :create, :fighter => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested fighter" do
        Fighter.should_receive(:find).with("37").and_return(mock_fighter)
        mock_fighter.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :fighter => {:these => 'params'}
      end

      it "assigns the requested fighter as @fighter" do
        Fighter.stub(:find).and_return(mock_fighter(:update_attributes => true))
        put :update, :id => "1"
        assigns[:fighter].should equal(mock_fighter)
      end

      it "redirects to the fighter" do
        Fighter.stub(:find).and_return(mock_fighter(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(fighter_url(mock_fighter))
      end
    end

    describe "with invalid params" do
      it "updates the requested fighter" do
        Fighter.should_receive(:find).with("37").and_return(mock_fighter)
        mock_fighter.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :fighter => {:these => 'params'}
      end

      it "assigns the fighter as @fighter" do
        Fighter.stub(:find).and_return(mock_fighter(:update_attributes => false))
        put :update, :id => "1"
        assigns[:fighter].should equal(mock_fighter)
      end

      it "re-renders the 'edit' template" do
        Fighter.stub(:find).and_return(mock_fighter(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested fighter" do
      Fighter.should_receive(:find).with("37").and_return(mock_fighter)
      mock_fighter.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the fighters list" do
      Fighter.stub(:find).and_return(mock_fighter(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(fighters_url)
    end
  end

end
