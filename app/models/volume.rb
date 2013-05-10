class Volume < ActiveRecord::Base
  attr_accessible :area_id, :region_id, :source, :volume, :year
  default_scope order: 'year ASC'
end
