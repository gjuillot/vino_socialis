class Comment < ActiveRecord::Base
  attr_accessible :comment, :commented
  
  belongs_to :user
  belongs_to :commented, polymorphic: true
end
