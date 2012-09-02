# -*- coding: utf-8 -*-

estate_name = 'Moët et Chandon'
unless Estate.find_by_name(estate_name)
  if Estate.create(name: estate_name, user_id: 1, owner: "LVMH", address: "20, avenue de Champagne", zip_code: "51333", town: "Epernay", country: "France", phone: "03 26 51 23 16", fax: "03 26 51 20 21", email: "", www: "http://www.moet.com", validation: true)
    puts "Estate #{estate_name} created"
  else
    puts "COULD NOT CREATE Estate #{estate_name}"
  end
end

estate = Estate.find_by_name(estate_name)
if estate
  [
    {name: 'Impérial', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Champagne').id, wine_color: 'sparkling_white', validation: true, info: ''},
    {name: 'Rosé Impérial', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Champagne').id, wine_color: 'sparkling_white', validation: true, info: ''},
    {name: 'Nectar Impérial', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Champagne').id, wine_color: 'sparkling_rose', validation: true, info: ''},
    {name: 'Grand Vintage', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Champagne').id, wine_color: 'sparkling_white', validation: true, info: ''}
  ].each do |wine|
    if Wine.where('name = ? AND estate_id = ? AND area_id = ? AND wine_color = ?', wine[:name], estate.id, wine[:area_id], wine[:wine_color]).count == 0
      if Wine.create(wine)
        puts "Wine #{estate_name} - " + wine[:name] + " created"
      else
        puts "COULD NOT CREATE #{estate_name} - " + wine[:name] + " created"
      end
    end
  end
end
