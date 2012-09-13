class WineRack < ActiveRecord::Base
  belongs_to :user
  has_many :wine_rack_positions
  
  validates :name, :presence => true
  validates :total_rows, :numericality => { :only_integer => true, :greater_than => 0 }
  validates :total_columns, :numericality => { :only_integer => true, :greater_than => 0 }
  validates :rows, :numericality => { :only_integer => true, :greater_than => 0 }
  validates :columns, :numericality => { :only_integer => true, :greater_than => 0 }
  
  def content
    WineRackPosition.where('wine_rack_id = ?', id).count
  end
  
  def capacity
    if (layout == 'simple')
      rows * columns * total_rows * total_columns
    elsif ((layout == 'front_back_cellar') || (layout == 'front_back_cellar_2'))
      (2 * columns - 1) * rows
    elsif layout == 'cabinet'
      total_rows * total_columns * ( (2*columns-1)*(rows/2) + (rows.even? ? 0 : columns) )
    elsif layout == 'cabinet'
      total_rows * total_columns
    else
      total_columns * ( (2*columns-1) * ((rows * total_rows) / 2) + ((rows * total_rows).even? ? 0 : columns))
    end
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
