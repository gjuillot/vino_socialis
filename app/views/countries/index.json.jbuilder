json.countries @countries do |json, country|
  json.slug country.slug
  json.name country.name
  json.regions country.regions.count
end