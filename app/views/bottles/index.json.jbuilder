json.bottles @bottles do |json, bottle|
  json.id bottle.id
  json.color bottle.wine.wine_color
  json.vintage formated_vintage(bottle.vintage)
  json.quantity bottle.quantity
  json.volume bottle.volume
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