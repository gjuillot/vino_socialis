xml.instruct!
xml.area do
  xml.slug @area.slug
  xml.name @area.name
  xml.estates do
    @estates.each do |estate, wines|
      xml.estate do
        xml.slug estate.slug
        xml.name estate.name
        xml.wines wines[:wines]
        xml.colors do
          wines[:colors].each do |color|
            xml.color color
          end
        end
      end
    end
  end
  xml.volumes do
    @area.volumes.each do |volume|
      xml.volume do
        xml.year volume.year
        xml.volume volume.volume
      end
    end
  end
  xml.superficies do
    @area.superficies.each do |superficy|
      xml.superficy do
        xml.year superficy.year
        xml.superficy superficy.superficy
      end
    end
  end
  xml.color_volumes_years do
    @color_volumes.each do |year, cvs|
      xml.color_volumes_year do
        xml.year year
        xml.color_volumes do
          cvs.each do |cv|
            xml.color_volume cv
          end
        end
      end
    end
  end
end