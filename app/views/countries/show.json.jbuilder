json.extract! @country, :slug, :name, :image_link, :image_source, :image_url
json.regions @regions do |json, region|
  json.slug region.slug
  json.name region.name
  json.areas region.areas.count
end