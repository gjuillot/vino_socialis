module WinesHelper
  def full_wine_name(wine, html = true)
    if (html)
      link_to(wine.estate.name, wine.estate) + " - " + link_to(wine.name, wine)
    else
      "#{wine.estate.name} - #{wine.name}"
    end
  end
end
