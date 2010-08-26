require 'spec_helper'

describe Club do
  
  it { should belong_to(:party) }
  it { should belong_to(:league) }
  it { should have_many(:club_memberships) }
  
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :party_id => 1,
      :league_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Club.create!(@valid_attributes)
  end
end
