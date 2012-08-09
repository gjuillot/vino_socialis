class Area < ActiveRecord::Base
  default_scope order: 'name ASC'
  belongs_to :region
  has_many :wines
end
