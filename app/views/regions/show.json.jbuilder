json.extract! @region, :slug, :name, :image_link, :image_source, :image_url
json.areas @areas, :slug, :name
json.volumes @region.volumes, :year, :volume
json.superficies @region.superficies, :year, :superficy
json.color_volumes @color_volumes