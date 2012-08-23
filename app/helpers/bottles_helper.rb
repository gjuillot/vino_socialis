module BottlesHelper
  
  def bottle_name(bottle, options = {})
    html ||= options[:html]
    wine_name(bottle.wine, estate: true, area: true, html: html) + " - #{bottle.vintage}"
  end
  
  def bottles_count_remaining
    Bottle.sum(:remaining_quantity)
  end
end
