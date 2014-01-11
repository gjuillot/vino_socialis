xml.instruct!
xml.countries do
  @countries.each do |country|
    xml.country do
      xml.slug country.slug
      xml.name country.name
      xml.regions country.regions.count
    end
  end
end