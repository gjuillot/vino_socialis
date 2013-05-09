class Superficy < ActiveRecord::Base
  attr_accessible :area_id, :region_id, :source, :superficy, :year
  default_scope order: 'year ASC'
end
