class Proposal < ActiveRecord::Base
  belongs_to :user
  
  default_scope :order => 'id ASC'
  scope :opened, where('opened = ?', true)
end
