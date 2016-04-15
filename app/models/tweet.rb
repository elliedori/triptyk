class Tweet < ActiveRecord::Base
  # Remember to create a migration!

  validates :body, limit: { maximum: 140 }, presence: true

  belongs_to :user
end
