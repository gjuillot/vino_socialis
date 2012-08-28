class Bottle < ActiveRecord::Base
  belongs_to :wine
  belongs_to :user
  
  def placed
    WineRackPosition.where('bottle_id = ?', id).count
  end
  
  def not_placed
    remaining_quantity - placed
  end
end
