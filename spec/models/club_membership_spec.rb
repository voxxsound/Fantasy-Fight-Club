require 'spec_helper'

describe ClubMembership do
  before(:each) do
    @valid_attributes = {
      :club_id => 1,
      :fighter_id => 1
    }
  end
  
  
  it { should belong_to(:club) }
  it { should belong_to(:fighter) }

  it "should create a new instance given valid attributes" do
    ClubMembership.create!(@valid_attributes)
  end
end
