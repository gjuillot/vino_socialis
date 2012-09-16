class Consumption < ActiveRecord::Base
  belongs_to :user
  belongs_to :bottle
  
  default_scope order: 'date DESC'
  
  validates :quantity, :numericality => { :only_integer => true, :greater_than => 0 }
end
