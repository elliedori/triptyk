class Quot < ActiveRecord::Base
  belongs_to :user
  has_many :requots_relationships, foreign_key: :requot_id
  has_many :requotters, through: :requots_relationships, source: :requotter
end
