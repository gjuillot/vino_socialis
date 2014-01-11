json.countries @countries do |json, country|
  json.extract! country, :slug, :name
  json.regions country.regions.count
end