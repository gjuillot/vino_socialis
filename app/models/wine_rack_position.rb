class WineRackPosition < ActiveRecord::Base
  belongs_to :wine_rack
  belongs_to :bottle
end
