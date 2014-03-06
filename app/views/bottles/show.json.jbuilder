json.extract! @bottle, :id, :volume, :date, :channel, :price, :channel_comments, :remaining_quantity, :initial_quantity, :comments, :current_value, :drink_min, :drink_max, :drink_best
json.vintage formated_vintage(@bottle.vintage)
json.wine do
  json.extract! @bottle.wine, :id, :name, :wine_color
  json.estate do
    json.extract! @bottle.wine.estate, :id, :name, :phone, :email, :www
  end
  json.area do
    json.extract! @bottle.wine.area, :id, :name
    json.region do
      json.extract! @bottle.wine.area.region, :id, :name
      json.country do
        json.extract! @bottle.wine.area.region.country, :id, :name
      end
    end
  end
end