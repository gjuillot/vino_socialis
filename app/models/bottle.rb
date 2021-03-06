class Bottle < ActiveRecord::Base
  belongs_to :wine
  belongs_to :user
  has_many :wine_rack_positions, dependent: :restrict
  has_many :consumptions, dependent: :restrict
  
  acts_as_taggable
  
  validates :initial_quantity, :numericality => { :only_integer => true, :greater_than => 0 }
  validates :price, :numericality => { :greater_than_or_equal_to => 0 }
  validates :current_value, :numericality => { :greater_than_or_equal_to => 0 }
  validates :drink_min, :numericality => { :only_integer => true, :greater_than_or_equal_to => 0 }
  validates :drink_max, :numericality => { :only_integer => true, :greater_than_or_equal_to => 0 }
  validates :drink_best, :numericality => { :only_integer => true, :greater_than_or_equal_to => 0 }
  
  scope :remain, lambda {|user| where('bottles.user_id = ? AND remaining_quantity > 0', user.id)}
  scope :rack, lambda {|rack| joins(:wine_rack_positions).where('"wine_rack_positions".wine_rack_id = ?', rack).group('"bottles".id')}
  scope :remaining_as_quantity, select('bottles.*, remaining_quantity AS quantity')
  scope :in_rack_as_quantity, select('bottles.*, count("wine_rack_positions".id) AS quantity')
  
  scope :best, where('vintage > 0 AND vintage + drink_best = ?', Time.now.year)
  scope :ready, where('vintage > 0 AND vintage + drink_min <= ? AND vintage + drink_max >= ?', Time.now.year, Time.now.year)
  scope :too_late, where('vintage > 0 AND vintage + drink_max < ?', Time.now.year)
  scope :too_soon, where('vintage > 0 AND vintage + drink_min > ?', Time.now.year)
  
  scope :color, lambda {|color| joins(:wine).where('"wines".wine_color = ?', color)}
  
  scope :name_like, lambda {|name| joins(:wine => :estate).select('"bottles".*').where('"estates".name ILIKE ? OR "wines".name ILIKE ?', "%#{name}%", "%#{name}%")}
  scope :area_like, lambda {|name| joins(:wine => {:area => {:region => :country}}).select('"bottles".*').where('"countries".name ILIKE ? OR "regions".name ILIKE ? OR "areas".name ILIKE ?', "%#{name}%", "%#{name}%", "%#{name}%")}
  scope :comments_like, lambda {|name| where('comments ILIKE ? OR channel_comments ILIKE ?', "%#{name}%", "%#{name}%")}
  
  scope :wine_order, lambda {|sens| joins(:wine => :estate).order('"estates".name ' + sens + ', "wines".name ' + sens)}
  scope :area_order, lambda {|sens| joins(:wine => {:area => {:region => :country}} ).order('"countries".name ' + sens + ', "regions".name ' + sens + ', "areas".name ' + sens)}
  scope :color_order, lambda {|sens| joins(:wine).order('"wines".wine_color ' + sens)}
  scope :other_order, lambda {|attribute, sens| order(attribute + ' ' + sens)}
  
  def placed
    WineRackPosition.where('bottle_id = ?', id).count
  end
  
  def not_placed
    remaining_quantity - placed
  end
  
  def positions_in(rack)
    WineRackPosition.where('bottle_id = ? AND wine_rack_id = ?', id, rack.id)
  end
  
  def distance(other)
    return 1 if self.wine.wine_color != other.wine.wine_color
    return 0.8 if self.wine.area.region.id != other.wine.area.region.id
    return 0.6 if self.wine.area.id != other.wine.area.id
    
    bonus_vintage = (self.vintage == other.vintage ? 0.1 : 0)
    return 0.4 - bonus_vintage if self.wine.estate.id != other.wine.estate.id
    return 0.2 - bonus_vintage if self.wine.id != other.wine.id
    return 0.1 - bonus_vintage
  end
  
  def drink_min_year
    vintage.to_i == 0 ? 0 : vintage.to_i + drink_min.to_i
  end
  
  def drink_max_year
    vintage.to_i == 0 ? 0 : vintage.to_i + drink_max.to_i
  end
  
  def drink_best_year
    vintage.to_i == 0 ? 0 : vintage.to_i + drink_best.to_i
  end
  
  def drink
    return 'ready' if vintage.to_i == 0
    year = Time.now.year
    return 'best' if year == drink_best_year
    return 'too_soon' if year < drink_min_year
    return 'too_late' if year > drink_max_year
    return 'ready'
  end
end
