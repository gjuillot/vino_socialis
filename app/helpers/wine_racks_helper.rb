module WineRacksHelper
  
  def compartment_letter(wine_rack, total_row, total_column)
    letters = ('A'..'Z').to_a  + ('AA'..'ZZ').to_a
    letters[total_row * wine_rack.total_columns + total_column]
  end
end