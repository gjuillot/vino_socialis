class AreaColorGrape < ActiveRecord::Base
  attr_accessible :area_id, :grape_variety_id, :color, :main
  default_scope order: 'color ASC, main DESC, name ASC', joins: :grape_variety
  
  belongs_to :grape_variety
  belongs_to :area
end
