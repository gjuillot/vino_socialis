class Wine < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name_for_url, use: :slugged
  def name_for_url
    "#{estate.name}_#{name}_#{area.name}_#{wine_color.gsub('_','-')}"
  end

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
  scope :area, lambda {|id| where('"wines".area_id = ?', id)}
  scope :region, lambda {|id| joins(:area).where('"areas".region_id = ?', id)}
  scope :last, lambda {|count| reorder('"updated_at DESC"').limit(count) }
  
  
  def validated?
    validation
  end
  
  def destroyable?
    not validated? and Bottle.where('wine_id = ?', id).count == 0 and Tasting.where('wine_id = ?', id).count == 0 and WineRecommandation.where('wine_id = ?', id).count == 0
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
    return false if user.nil?
    recommandations.each do |r|
      if (r.user_id == user.id) 
        return true
      end
    end
    return false
  end
  
  RED = %w[red red_port_type sparkling_red]
  ROSE = %w[rose sparkling_rose claret]
  WHITE = %w[white sweet_white moelleux_white white_port_type sparkling_white natural_sweet vin_jaune vin_paille amber]
  COLORS = %w[white red rose sweet_white moelleux_white white_port_type sparkling_white natural_sweet red_port_type sparkling_red sparkling_rose claret vin_jaune vin_paille amber]
  
  def red?
    RED.include? wine_color
  end
  
  def rose?
    ROSE.include? wine_color
  end
  
  def white?
    WHITE.include? wine_color
  end
  
  def sparkling?
    wine_color.include? 'sparkling'
  end
  
  def distance(other)
    return 1 if self.wine_color != other.wine_color
    return 0.8 if self.area.region.id != other.area.region.id
    return 0.6 if self.area.id != other.area.id
    return 0.4 if self.estate.id != other.estate.id
    return 0.2 if self.id != other.id
    return 0
  end
  
  def drink_hint
    hint = {min: 0, max: 0, best: 0, based_on: 0}
    similar = Bottle.joins(:wine => :area).where('"wines".wine_color = ? AND "areas".region_id = ? AND "bottles".drink_min > 0 AND "bottles".drink_max > 0 AND "bottles".drink_best > 0', self.wine_color, self.area.region_id)
    if similar.count > 0
      hint[:based_on] = similar.count
      coeffs = 0
      similar.each do |b|
        coeff = 1 - self.distance(b.wine)
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
