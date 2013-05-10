class ColorVolume < ActiveRecord::Base
  attr_accessible :area_id, :region_id, :color, :volume, :year
  default_scope order: 'year ASC, volume DESC'
end
