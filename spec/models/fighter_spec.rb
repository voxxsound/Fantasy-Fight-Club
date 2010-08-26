require 'spec_helper'

describe Fighter do
  before(:each) do
    @valid_attributes = {
      :organization_id => 1,
      :first_name => "value for first_name",
      :last_name => "value for last_name",
      :nickname => "value for nickname",
      :weightclass => "value for weightclass"
    }
  end

  it { should have_many(:club_memberships) }

  it "should create a new instance given valid attributes" do
    Fighter.create!(@valid_attributes)
  end
end
