class ClubMembership < ActiveRecord::Base
  belongs_to :club
  belongs_to :fighter
end
