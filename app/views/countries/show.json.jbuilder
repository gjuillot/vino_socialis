json.extract! @country, :slug, :name, :image_link, :image_source, :image_url
json.regions @regions do |json, region|
  json.(region, :slug, :name)
  json.areas region.areas.count
end