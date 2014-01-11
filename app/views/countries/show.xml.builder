xml.instruct!
xml.country do
  xml.slug @country.slug
  xml.name @country.name
  xml.image_link @country.image_link
  xml.image_source @country.image_source
  xml.image_url @country.image_url
  xml.regions do
    @regions.each do |region|
      xml.region do
        xml.slug region.slug
        xml.name region.name
        xml.areas region.areas.count
      end
    end
  end
end