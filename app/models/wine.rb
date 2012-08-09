class Wine < ActiveRecord::Base
  belongs_to :estate
  belongs_to :area
  belongs_to :wine_color
  belongs_to :user
  
  def validated?
    validation
  end
end
