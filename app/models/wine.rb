class Wine < ActiveRecord::Base
  belongs_to :estate
  belongs_to :area
  belongs_to :wine_color
  belongs_to :user
  has_many :tastings
  
  def validated?
    validation
  end
  
  def region_id
    area.region_id
  end
end
