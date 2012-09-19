# -*- coding: utf-8 -*-

{
  'Österreich' => {
    'Niederösterreich' => [
      'Wachau',
      'Kremstal',
      'Kamptal',
      'Traisental',
      'Wagram',
      'Weinviertel',
      'Carnuntum',
      'Thermenregion'
    ],
    'Burgenland' => [
      'Neusiedlersee',
      'Leithaberg/Neusiedlersee-Hügelland',
      'Mittelburgenland',
      'Eisenberg/Südburgenland'
    ],
    'Steiermark' => [
      'Südosteiermark',
      'Südsteiermark',
      'Weststeiermark'
    ],
    'Wien' => [
      'Wien'
    ]
  }
}.each do |s_country, regions|
  country = Country.find_or_create_by_name(s_country)
  regions.each do |s_region, areas|
    region = Region.find_or_create_by_name(s_region)
    region.country =  country
    region.save
    areas.each do |s_area|
      area = Area.find_or_create_by_name(s_area)
      area.region = region
      area.save
    end
  end
end

