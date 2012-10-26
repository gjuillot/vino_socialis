module BottlesHelper
  
  def bottle_name(bottle, options = {})
    html ||= options[:html]
    wine_name(bottle.wine, estate: true, area: true, html: html) + " - " + formated_vintage(bottle.vintage, false).to_s
  end
  
  def bottles_count_remaining
    Bottle.sum(:remaining_quantity)
  end
end
