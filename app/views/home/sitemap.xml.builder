xml.instruct!
xml.urlset "xmlns" => "http://www.sitemaps.org/schemas/sitemap/0.9" do

  xml.url do
    xml.loc "http://www.vinosus.fr"
  end
  
  [grape_varieties_path, countries_path, regions_path, areas_path, glossaries_path, vintages_path].each do |path|
    xml.url do
      xml.loc path
    end
  end

  @estates.each do |estate|
    xml.url do
      xml.loc estate_path(estate)
    end
  end

  @wines.each do |wine|
    xml.url do
      xml.loc wine_path(wine)
    end
  end

end