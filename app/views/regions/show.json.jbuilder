json.extract! @region, :slug, :name, :image_link, :image_source, :image_url
json.areas @areas do |json, area|
  json.slug area.slug
  json.name area.name
  json.wines area.wines.count
  json.colors area.colors.keys
end
json.volumes @region.volumes, :year, :volume
json.superficies @region.superficies, :year, :superficy
json.color_volumes @color_volumes