require 'spec_helper'

describe League do
  before(:each) do
    @valid_attributes = {
      :name => "value for name"
    }
  end
  
  it { should have_many(:clubs) }

  it "should create a new instance given valid attributes" do
    League.create!(@valid_attributes)
  end
end
