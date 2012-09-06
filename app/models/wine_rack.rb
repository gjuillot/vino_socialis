class WineRack < ActiveRecord::Base
  belongs_to :user
  has_many :wine_rack_positions
  
  def content
    WineRackPosition.where('wine_rack_id = ?', id).count
  end
  
  def capacity
    rows * columns
  end
  
  def compartment_letter(total_row, total_column)
    if ((layout == 'front_back_cellar') || (layout == 'front_back_cellar_2'))
      total_column == 0 ? 'Avant' : 'Arriere'
    else
      letters = ('A'..'Z').to_a  + ('AA'..'ZZ').to_a
      letters[total_row * total_columns + total_column]
    end
  end
end
