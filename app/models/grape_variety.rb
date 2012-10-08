class GrapeVariety < ActiveRecord::Base
  has_and_belongs_to_many :wines
  
  default_scope order('name ASC')
  scope :validated, where('validation = ?', true)
  scope :not_validated, where('validation = ?', false)
end
