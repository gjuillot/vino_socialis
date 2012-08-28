class WineRack < ActiveRecord::Base
  belongs_to :user
  has_many :wine_rack_positions
  
  def content
    WineRackPosition.where('wine_rack_id = ?', id).count
  end
  
  def capacity
    rows * columns
  end
end
