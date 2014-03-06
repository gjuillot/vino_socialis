json.bottles @bottles do |json, bottle|
  json.extract! bottle, :id, :volume, :remaining_quantity
  json.vintage formated_vintage(bottle.vintage)
  json.wine do
    json.extract! bottle.wine, :name, :wine_color
    json.estate do
      json.extract! bottle.wine.estate, :name
    end
    json.area do
      json.extract! bottle.wine.area, :name
    end
  end
end