# -*- coding: utf-8 -*-

estate_name = 'Château Carbonnieux'
unless Estate.find_by_name(estate_name)
  if Estate.create(name: estate_name, user_id: 1, owner: "Famille Perin", address: "", zip_code: "33850", town: "Léognan", country: "France", phone: "05 57 96 56 20", fax: "05 57 96 59 19", email: "info@chateau-carbonnieux.com", www: "http://www.carbonnieux.com/", validation: true)
    puts "Estate #{estate_name} created"
  else
    puts "COULD NOT CREATE Estate #{estate_name}"
  end
end

estate = Estate.find_by_name(estate_name)
if estate
  [
    {name: 'Château Carbonnieux', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Pessac-Léognan').id, wine_color: 'red', validation: true, info: ''},
    {name: 'Château Carbonnieux', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Pessac-Léognan').id, wine_color: 'white', validation: true, info: ''},
    {name: 'Château Tour Léognan', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Pessac-Léognan').id, wine_color: 'red', validation: true, info: ''},
    {name: 'Château Tour Léognan', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Pessac-Léognan').id, wine_color: 'white', validation: true, info: ''},
    {name: 'La Croix de Carbonnieux', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Pessac-Léognan').id, wine_color: 'red', validation: true, info: ''},
    {name: 'La Croix de Carbonnieux', estate_id: estate.id, user_id: 1, area_id: Area.find_by_name('Pessac-Léognan').id, wine_color: 'white', validation: true, info: ''}
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
