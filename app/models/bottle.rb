class Bottle < ActiveRecord::Base
  belongs_to :wine
  belongs_to :user
  has_many :wine_rack_positions
  
  validates :initial_quantity, :numericality => { :only_integer => true, :greater_than => 0 }
  validates :price, :numericality => { :greater_than_or_equal_to => 0 }
  
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
