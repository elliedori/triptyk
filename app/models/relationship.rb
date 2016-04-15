class Relationship < ActiveRecord::Base
  # Remember to create a migration!

  belongs_to :user, foreign_key: "followee_id"
  belongs_to :user, foreign_key: "follower_id"

end
