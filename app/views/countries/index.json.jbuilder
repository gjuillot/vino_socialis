json.countries @countries do |json, country|
  json.(country, :slug, :name)
  json.regions country.regions.count
end