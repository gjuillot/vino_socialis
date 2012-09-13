class Consumption < ActiveRecord::Base
  belongs_to :user
  belongs_to :bottle
  
  validates :quantity, :numericality => { :only_integer => true, :greater_than => 0 }
end
