class Wine < ActiveRecord::Base
  belongs_to :estate
  belongs_to :area
  belongs_to :user
  has_many :tastings
  
  def validated?
    validation
  end
  
  def region_id
    area.region_id
  end
  
  COLORS = %w[white red rose sweet_white moelleux_white white_port_type sparkling_white natural_sweet red_port_type sparkling_red sparkling_rose claret vin_jaune vin_paille amber]
end
