class WineRackPosition < ActiveRecord::Base
  belongs_to :wine_rack
  belongs_to :bottle
  
  def coord
    wine_rack.compartment_letter(total_row, total_column) + "." + String(row) + "." + String(column)
  end
end
