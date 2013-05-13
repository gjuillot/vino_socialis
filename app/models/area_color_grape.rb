class AreaColorGrape < ActiveRecord::Base
  attr_accessible :area_id, :grape_variety_id, :color
  default_scope order: 'color ASC'
  
  belongs_to :grape_variety
end
