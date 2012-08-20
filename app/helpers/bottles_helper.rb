module BottlesHelper
  
  def link_to_encave(path)
    link_to content_tag(:i, "", class: "icon-shopping-cart"), path, method: :post
  end
  
  def bottle_name(bottle, options = {})
    html ||= options[:html]
    wine_name(bottle.wine, estate: true, area: true, html: html) + " - #{bottle.vintage}"
  end
end
