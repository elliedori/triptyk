class RequotsRelationship < ActiveRecord::Base
  belongs_to :requot, class_name: "Quot"
  belongs_to :requotter, class_name: "User"
end
