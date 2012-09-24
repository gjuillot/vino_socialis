class Wine < ActiveRecord::Base
  belongs_to :estate
  belongs_to :area
  belongs_to :user
  
  has_many :bottles
  has_many :tastings
  has_many :wine_recommandations
  
  validates :name, :presence => true
  validates :area_id, :presence => true
  validates :wine_color, :presence => true
  
  default_scope readonly(false).joins(:estate).order('"estates".name ASC, "wines".name ASC')
  scope :random, reorder('random()').limit(5)
  scope :not, lambda{|id| where('"wines".id != ?', id)}
  scope :validated, where('"wines".validation = ?' , true)
  scope :not_validated, where('"wines".validation = ?' , false)
  scope :like, lambda {|name| where('"wines".name LIKE ? OR "estates".name LIKE ?', "%#{name}%", "%#{name}%").reorder('"wines".validation DESC, "estates".name ASC, "wines".name ASC')}
  scope :on_page, lambda {|page| page(page).per(10)}
  scope :area, lambda {|id| where('"wines".area_id == ?', id)}
  scope :region, lambda {|id| joins(:area).where('"areas".region_id = ?', id)}
  
  
  
  def validated?
    validation
  end
  
  def region_id
    area.region_id
  end
  
  def recommandations
    wine_recommandations
  end
  
  def recommandations_but(user)
    WineRecommandation.where('wine_id = ? AND user_id != ?', self.id, user.id)
  end
  
  def recommanded_by?(user)
    recommandations.each do |r|
      if (r.user_id == user.id) 
        return true
      end
    end
    return false
  end
  
  COLORS = %w[white red rose sweet_white moelleux_white white_port_type sparkling_white natural_sweet red_port_type sparkling_red sparkling_rose claret vin_jaune vin_paille amber]

  def dist_euclide(other)
    return 0 if self.id == other.id

    dist = 0
    dist += 0.1 if (self.estate.id != other.estate.id)
    dist += 0.1 if (self.area.id != other.area.id)
    dist += 0.2 if (self.area.region.id != other.area.region.id)
    dist += 0.5 if (self.wine_color != other.wine_color)
    return dist
  end
end
