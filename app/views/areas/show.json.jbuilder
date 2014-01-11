json.extract! @area, :slug, :name

estates = []
@estates.each do |estate, wines|
  estates << {
      slug: estate.slug,
      name: estate.name,
      wines: wines[:wines],
      colors: wines[:colors]
    }
end

json.estates estates
json.volumes @area.volumes, :year, :volume
json.superficies @area.superficies, :year, :superficy
json.color_volumes @color_volumes