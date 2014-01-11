xml.instruct!
xml.region do
  xml.slug @region.slug
  xml.name @region.name
  xml.image_link @region.image_link
  xml.image_source @region.image_source
  xml.image_url @region.image_url
  xml.areas do
    @areas.each do |area|
      xml.area do
        xml.slug area.slug
        xml.name area.name
        xml.wines area.wines.count
      end
    end
  end
  xml.volumes do
    @region.volumes.each do |volume|
      xml.volume do
        xml.year volume.year
        xml.volume volume.volume
      end
    end
  end
  xml.superficies do
    @region.superficies.each do |superficy|
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