class Wine < ActiveRecord::Base
  belongs_to :estate
  belongs_to :area
  has_and_belongs_to_many :grape_varieties
  
  belongs_to :user
  
  has_many :bottles
  has_many :tastings
  has_many :wine_recommandations
  has_many :labels
  
  validates :name, :presence => true
  validates :area_id, :presence => true
  validates :wine_color, :presence => true
  
  default_scope readonly(false).joins(:estate).order('"estates".name ASC, "wines".name ASC')
  scope :random, reorder('random()').limit(5)
  scope :not, lambda{|id| where('"wines".id != ?', id)}
  scope :validated, where('"wines".validation = ?' , true)
  scope :not_validated, where('"wines".validation = ?' , false)
  scope :like, lambda {|name| where('"wines".name ILIKE ? OR "estates".name ILIKE ?', "%#{name}%", "%#{name}%").reorder('"wines".validation DESC, "estates".name ASC, "wines".name ASC')}
  scope :on_page, lambda {|page| page(page).per(10)}
  scope :area, lambda {|id| where('"wines".area_id == ?', id)}
  scope :region, lambda {|id| joins(:area).where('"areas".region_id = ?', id)}
  scope :last, lambda {|count| order('"id DESC"').limit(count) }
  
  
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
  
  def drink_hint
    hint = {min: 0, max: 0, best: 0, based_on: 0}
    similar = Bottle.joins(:wine => :area).where('"wines".wine_color = ? AND "areas".region_id = ? AND "bottles".drink_min > 0 AND "bottles".drink_max > 0 AND "bottles".drink_best > 0', self.wine_color, self.area.region_id)
    if similar.count > 0
      hint[:based_on] = similar.count
      coeffs = 0
      similar.each do |b|
        coeff = 1 - self.dist_euclide(b.wine)
        coeffs += coeff
        hint[:min] += coeff * b.drink_min
        hint[:max] += coeff * b.drink_max
        hint[:best] += coeff * b.drink_best
      end
      hint[:min] = (hint[:min]/coeffs).round
      hint[:max] = (hint[:max]/coeffs).round
      hint[:best] = (hint[:best]/coeffs).round
    end
    return hint
  end
end
