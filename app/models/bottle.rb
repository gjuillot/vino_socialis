class Bottle < ActiveRecord::Base
  belongs_to :wine
  belongs_to :user
  has_many :wine_rack_positions
  
  validates :initial_quantity, :numericality => { :only_integer => true, :greater_than => 0 }
  validates :price, :numericality => { :greater_than_or_equal_to => 0 }
  
  scope :remain, lambda {|user| where('bottles.user_id = ? AND remaining_quantity > 0', user.id)}
  scope :rack, lambda {|rack| joins(:wine_rack_positions).where('"wine_rack_positions".wine_rack_id = ?', rack).group('"bottles".id')}
  scope :remaining_as_quantity, select('*, remaining_quantity AS quantity')
  scope :in_rack_as_quantity, select('bottles.*, count("wine_rack_positions".id) AS quantity')
  scope :name_like, lambda {|name| joins(:wine => :estate).where('"estates".name ILIKE ? OR "wines".name ILIKE ?', "%#{name}%", "%#{name}%")}
  scope :area_like, lambda {|name| joins(:wine => {:area => {:region => :country}}).where('"countries".name ILIKE ? OR "regions".name ILIKE ? OR "areas".name ILIKE ?', "%#{name}%", "%#{name}%", "%#{name}%")}
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
  
  def dist_euclide(other)
    self.wine.dist_euclide(other.wine) + (self.vintage == other.vintage ? 0 : 0.05)
  end
end
