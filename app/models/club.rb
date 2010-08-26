class Club < ActiveRecord::Base
  belongs_to :party
  belongs_to :league
  has_many :club_memberships
end
