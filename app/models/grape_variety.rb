class GrapeVariety < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  has_and_belongs_to_many :wines
  has_many :area_color_grapes
  
  default_scope order('name ASC')
  scope :validated, where('validation = ?', true)
  scope :not_validated, where('validation = ?', false)
  
  def areas
    areas = {:main => {}, :second => {}}
    self.area_color_grapes.each do |acg|
      tmp = acg.main ? areas[:main] : areas[:second]
      tmp[acg.area] = [] unless tmp.has_key? acg.area
      tmp[acg.area] << acg.color
    end
    return areas
  end
end
