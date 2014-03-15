json.extract! @wine, :id, :name, :wine_color, :info, :temperature, :validated?
json.user do
  json.extract! @wine.user, :id, :name
end
json.area do
  json.extract! @wine.area, :id, :name
  json.region do
    json.extract! @wine.area.region, :id, :name
    json.country do
      json.extract! @wine.area.region.country, :id, :name
    end
  end
end
json.grape_varieries @wine.grape_varieties do |json, grape_variety|
  json.extract! grape_variety, :id, :name
end